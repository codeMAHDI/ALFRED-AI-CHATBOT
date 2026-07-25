param(
    [int]$Port = 8888,
    [switch]$SkipRedis
)

$ErrorActionPreference = "Stop"

$BackendRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$RuntimeDir = Join-Path $BackendRoot ".runtime"
$LogsDir = Join-Path $RuntimeDir "logs"
$PidFile = Join-Path $RuntimeDir "backend-dev.pids.json"
$EnvFile = Join-Path $BackendRoot ".env"
$PythonExe = Join-Path $BackendRoot ".venv\Scripts\python.exe"

New-Item -ItemType Directory -Force -Path $RuntimeDir, $LogsDir | Out-Null

function Import-DotEnv {
    param([string]$Path)

    if (-not (Test-Path $Path)) {
        Write-Host "No .env file found at $Path. Continuing with current shell environment."
        return
    }

    Get-Content $Path | ForEach-Object {
        $line = $_.Trim()
        if (-not $line -or $line.StartsWith("#")) {
            return
        }

        $equalsIndex = $line.IndexOf("=")
        if ($equalsIndex -lt 1) {
            return
        }

        $key = $line.Substring(0, $equalsIndex).Trim()
        $value = $line.Substring($equalsIndex + 1).Trim()
        $value = $value.Trim('"').Trim("'")

        [Environment]::SetEnvironmentVariable($key, $value, "Process")
    }
}

function Resolve-CommandPath {
    param([string]$Command)

    $resolved = Get-Command $Command -ErrorAction SilentlyContinue
    if ($resolved) {
        return $resolved.Source
    }
    return $null
}

function Start-BackendProcess {
    param(
        [string]$Name,
        [string]$FilePath,
        [string[]]$Arguments
    )

    $stdout = Join-Path $LogsDir "$Name.out.log"
    $stderr = Join-Path $LogsDir "$Name.err.log"

    $process = Start-Process `
        -FilePath $FilePath `
        -ArgumentList $Arguments `
        -WorkingDirectory $BackendRoot `
        -RedirectStandardOutput $stdout `
        -RedirectStandardError $stderr `
        -WindowStyle Hidden `
        -PassThru

    [pscustomobject]@{
        name = $Name
        pid = $process.Id
        command = "$FilePath $($Arguments -join ' ')"
        stdout = $stdout
        stderr = $stderr
    }
}

if (-not (Test-Path $PythonExe)) {
    $PythonExe = "python"
}

if (Test-Path $PidFile) {
    Write-Host "Existing PID file found. Run scripts/stop-dev.ps1 first if the previous stack is still running."
    Write-Host "PID file: $PidFile"
    exit 1
}

Import-DotEnv $EnvFile

$env:DJANGO_SETTINGS_MODULE = "core.settings"

# Local Windows dev usually connects to Redis through localhost. The value
# "redis" is meant for Docker Compose service discovery.
if ($env:REDIS_HOST -eq "redis" -or -not $env:REDIS_HOST) {
    $env:REDIS_HOST = "localhost"
}
if (-not $env:REDIS_PORT) {
    $env:REDIS_PORT = "6379"
}

$started = @()

if (-not $SkipRedis) {
    $RedisServer = Resolve-CommandPath "redis-server"
    if ($RedisServer) {
        $started += Start-BackendProcess `
            -Name "redis" `
            -FilePath $RedisServer `
            -Arguments @("--port", $env:REDIS_PORT)
    } else {
        Write-Host "redis-server was not found in PATH. Start Redis manually, or rerun with -SkipRedis if it is already running."
        Write-Host "Expected Redis URL: redis://$($env:REDIS_HOST):$($env:REDIS_PORT)/0"
    }
}

$started += Start-BackendProcess `
    -Name "asgi" `
    -FilePath $PythonExe `
    -Arguments @("-m", "daphne", "-b", "0.0.0.0", "-p", "$Port", "core.asgi:application")

$started += Start-BackendProcess `
    -Name "celery-worker" `
    -FilePath $PythonExe `
    -Arguments @("-m", "celery", "-A", "core", "worker", "--loglevel=info", "--pool=solo")

$started += Start-BackendProcess `
    -Name "celery-beat" `
    -FilePath $PythonExe `
    -Arguments @("-m", "celery", "-A", "core", "beat", "--loglevel=info")

$started | ConvertTo-Json -Depth 4 | Set-Content -Path $PidFile -Encoding UTF8

Write-Host ""
Write-Host "Backend dev stack started."
Write-Host "Docs: http://localhost:$Port/api/docs/"
Write-Host "LAN:  http://$((Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -like '10.*' -or $_.IPAddress -like '192.168.*' -or $_.IPAddress -like '172.*' } | Select-Object -First 1).IPAddress):$Port/api/docs/"
Write-Host "Logs: $LogsDir"
Write-Host "Stop: .\scripts\stop-dev.ps1"
Write-Host ""

$started | Format-Table name, pid
