# Alfred - AI Dating Concierge (Backend)

## Overview

The backend of **Alfred - AI Dating Concierge** is built with **Django** and **Django REST Framework (DRF)**.

The backend acts as the central business layer of the application. It is responsible for authentication, user management, subscriptions, conversation history, AI integration, scheduling, notifications, and all database operations.

The AI service itself is completely **stateless** and does not directly communicate with the mobile application. Instead, the backend works as a middleware between the frontend and the AI service.

```
Flutter App
      │
      ▼
 Django Backend
      │
      ▼
 FastAPI AI Service
      │
      ▼
 OpenAI / Anthropic / External APIs
```

---

# Technology Stack

## Backend

- Python
- Django
- Django REST Framework
- PostgreSQL
- JWT Authentication
- Django Channels (WebSockets)
- Redis
- Celery
- Celery Beat
- drf-spectacular (Swagger/OpenAPI)

## External Services

- FastAPI AI Service
- OpenAI API
- Anthropic API
- SERP API
- Future Payment Providers
- Firebase Cloud Messaging (planned)

---

# Architecture

The backend follows a **feature-based architecture**.

```
Backend/
│
├── core/
│
├── apps/
│   ├── users/
│   ├── authentication/
│   ├── chat/
│   ├── ai_gateway/
│   ├── plans/
│   ├── calendar/
│   ├── notifications/
│   ├── subscriptions/
│   ├── common/
│   └── api/
│
├── requirements.txt
└── manage.py
```

Each application owns its own models, serializers, services, permissions, views, urls, tasks and business logic.

---

# Backend Responsibilities

The backend is responsible for:

- User authentication
- JWT authorization
- User profile management
- Onboarding
- AI request validation
- Calling AI APIs
- Persisting AI responses
- Conversation history
- WebSocket communication
- Date plans
- Calendar events
- Notifications
- Subscription validation
- API documentation
- Business rules

The backend **does not contain AI logic**.

---

# AI Integration

The AI service is designed to be **stateless**.

The backend is the source of truth.

```
User

↓

Flutter

↓

Backend

↓

Load Conversation

↓

Prepare Context

↓

Call AI

↓

Receive Response

↓

Save Response

↓

Return to Client
```

The AI service never directly accesses the database.

---

# Real-Time Communication

Since Alfred is primarily a **voice assistant**, real-time communication is implemented using **WebSockets (Django Channels)**.

WebSockets will be used for:

- Live conversations
- Voice sessions
- Streaming AI responses
- Typing indicators
- Future real-time notifications

Standard CRUD operations continue to use REST APIs.

---

# Core Features

## User

Stores:

- Basic account information
- Profile
- Preferences
- Subscription state
- Authentication provider
- Device token
- Email Login
- Registration
- Password Reset
- Email Verification
- JWT Authentication
- Google Login (future)
- Apple Login (future)

---

## Chat

Responsible for:

- Conversations
- Messages
- Voice sessions
- Chat history
- WebSocket consumers

Every conversation is stored permanently inside PostgreSQL.

---

## AI Gateway

The AI Gateway communicates with the FastAPI service.

Responsibilities:

- Prepare AI requests
- Pass conversation history
- Receive AI responses
- Handle failures
- Return structured data

No AI logic exists inside Django.

---

## Plans

Stores AI-generated or manually created date plans.

Users can:

- Save plans
- Edit plans
- Delete plans
- View history
- View upcoming plans

---

## Calendar

Responsible for scheduling.

Supports:

- Upcoming events
- Date reminders
- Future Google Calendar integration

---

## Notifications

Responsible for:

- In-app notifications
- Reminder scheduling

---

## Subscriptions

Responsible for:

- Premium validation
- Subscription status
- Future payment integration

The initial MVP stores the current subscription state inside the `User` model for quick authorization checks.

A dedicated `UserSubscription` model will be introduced during payment implementation to manage subscription history, provider transactions, renewals, and billing logic while keeping the `User` model synchronized with the current active subscription.

---

# Admin Dashboard (Planned)

An internal React-based admin dashboard will be developed for administrators to manage the platform.

## Authentication

- Admin Login
- Admin Logout
- Change Password
- Update Profile
  - Profile Picture
  - Full Name
  - Bio

## Dashboard & Analytics

- User Statistics
- Active User Statistics
- Subscription & Payment Statistics
- Revenue Overview (Future)
- System Activity Summary

## User Management

- View User List
- Search & Filter Users
- Retrieve User Details
- Block / Unblock Users (Future)
- Manage User Accounts

## Subscription & Payment Management

- View Subscription List
- Retrieve Subscription Details
- View Payment History
- Manage Subscription Status (Future)

## Notifications

- View Notifications
- Mark Notifications as Read

## General Features

- Server-side Pagination
- Searching
- Filtering
- Sorting
- Secure Admin Permissions
- Role-based Access Control (Future)

---

# Design Principles

- Feature-based architecture
- Separation of concerns
- Thin Views
- Service Layer pattern
- Repository-independent business logic
- Stateless AI
- Backend as the single source of truth
- WebSocket-first communication for voice interactions
- REST APIs for CRUD operations
- Scalable and maintainable codebase

---

# Future Improvements

- Subscription Payments
- AI Streaming
- Google Calendar Sync
- Background Workers
- Admin Dashboard Improvements
- Multi-device Support

---

# Project Status

🚧 Currently under active development.