class AppStrings {
  static RegExp passRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.{8,}$)');
  static RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String fieldCantBeEmpty = "Field can't be empty";
  static const String emailFieldCantBeEmpty = "Please enter your email";
  static const String passwordFieldCantBeEmpty = "Please enter your password";
  static const String checkNetworkConnection = "Check network connection";
  static const String enterThe8Character = "Please Enter The 8 character";
  static const String passwordNotMatch = "Passwords do not match";
  static const String selectYourProfileImage = "Select Your Profile Image";

  //================== Custom Controller String ===================//
  static const String item = "Item";

  ///========================== Onboarding Screen =====================//
  // Splash
  static const String alfred = "A L F R E D";
  static const String yourPersonalDateConcierge = "YOUR PERSONAL DATE CONCIERGE";
  static const String initializingSecureConcierge = "INITIALIZING SECURE CONCIERGE...";

  // Onboarding 1
  static const String planYourLife = "Plan Your Life\nWithout The Stress";
  static const String planYourLifeSub = "Let Alfred handle the details of your\nschedule, dining, and travel while you\nfocus on what truly matters.";
  static const String alreadyHaveAccountSignIn = "Already have an account? Sign in";

  // Onboarding 2
  static const String meetAlfred = "Meet Alfred";
  static const String meetAlfredSub = "Your AI-powered personal concierge\nfor unforgettable dates.";
  static const String tailoredSuggestions = "Tailored Suggestions";
  static const String premiumAccess = "Premium Access";
  static const String back = "Back";

  // Onboarding 3
  static const String smartPlanning = "Smart Planning";
  static const String smartPlanningSub = "Dates, schedules, restaurants and\nactivities handled automatically.";
  static const String exclusiveDining = "Exclusive Dining";
  static const String exclusiveDiningSub = "Secured reservations at top-tier venues.";
  static const String bespokeTravel = "Bespoke Travel";
  static const String bespokeTravelSub = "Itineraries tailored to your specific pace.";

  // Common

  static const String skip = "Skip";
  static const String next = "Next";
  static const String continueTxt = "Continue";
  static const String getStarted = "Get Started";
  static const String alreadyHaveAnAccount = "Already have an account? ";
  static const String hostigo = "Hostigo";
  static const String simplifyYourPropertyManagement =
      "Simplify your property management.";
  static const String welcomeToHostigo = "Welcome to Hostigo";
  static const String welcomeToHostigoSubtitle =
      "List properties, manage bookings, and track services - all in one connected platform.";
  static const String stayInControlWithHostigo = "Stay in control with Hostigo";
  static const String stayInControlWithHostigoSubtitle =
      "Manage your properties, track tasks, and connect with your team wherever you go.";
  static const String selectYourRole = "Select Your Role";
  static const String chooseHowYoulluseHostigo =
      "Choose how you\'ll use 2SEATS";

  static const String serviceProvider = "Service Provider";
  static const String serviceProviderDes =
      "View and complete tasks, and receive direct payments.";
  static const String guest = "Guest";

  ///========================== Auth Screen =====================//
  // Login
  static const String welcomeTo = "Welcome To";
  static const String alfredTitle = "Alfred";
  static const String yourSilentPartner = "Your silent partner in exceptional living.";
  static const String emailAddress = "EMAIL ADDRESS";
  static const String emailHint = "name@example.com";
  static const String signInCaps = "SIGN IN";
  static const String orContinueWith = "OR CONTINUE WITH";
  static const String google = "Google";
  static const String apple = "Apple";
  static const String newHere = "New here? ";
  static const String createAnAccount = "Create an account";
  static const String byContinuing = "By continuing, you agree to our";
  static const String termsOfService = "Terms of Service";
  static const String andText = " and ";

  // Signup
  static const String joinAlfred = "Join Alfred";
  static const String yourPersonalConcierge = "Your personal concierge for\nexceptional living.";
  static const String nameCaps = "NAME";
  static const String nameHint = "Johnathan Sterling";
  static const String emailCaps = "EMAIL";
  static const String emailSignupHint = "sterling@private.estate";
  static const String passwordCaps = "PASSWORD";
  static const String confirmPasswordCaps = "CONFIRM PASSWORD";
  static const String createAccountCaps = "CREATE ACCOUNT";
  static const String byCreatingAccount = "By creating an account, you agree to our ";
  static const String alreadyHaveAccount = "Already have an account? ";
  static const String signInLink = "Sign in";

  // OTP
  static const String verifyYourIdentity = "Verify Your Identity";
  static const String weSentCode = "We've sent a 6-digit code to";
  static const String didntReceiveCode = "Didn't receive the code? ";
  static const String resendLink = "Resend";
  static const String verifyCaps = "VERIFY";

  // Common Auth
  static const String signIn = "Sign In";
  static const String createAccount = "Create Account";
  static const String password = "PASSWORD";
  static const String forgotPasswordQ = "Forgot Password?";
  static const String privacyPolicy = "Privacy Policy";
  static const String fullName = "Full Name";
  static const String confirmPassword = "Confirm Password";

  ///========================== Forgot Password =====================//
  static const String forgotPassword = "FORGOT PASSWORD";
  static const String forgotPasswordDesc =
      "Enter your registered email or phone number and we'll send you a link to reset your password.";
  static const String requestOtp = "Request OTP";
  static const String backToLogin = "Back to Login";

  ///========================== Verify OTP =====================//
  static const String verifyOtp = "VERIFY OTP";
  static const String verifyOtpDesc =
      "Enter the 6-digit code sent to your email or phone number.";
  static const String resendCodeIn = "Resend code in ";
  static const String verify = "Verify";
  static const String resend = "Resend";

  ///========================== Set New Password =====================//
  static const String setNewPassword = "SET A NEW PASSWORD";
  static const String passwordMustHave = "Password must have 6-8 characters.";
  static const String newPassword = "New Password";
  static const String confirmNewPassword = "Confirm New Password";
  ///========================== Profile Setup Screen =====================//
  static const String step1Of3 = "Step 1 of 3";
  static const String step2Of3 = "Step 2 of 3";
  static const String step3Of3 = "Step 3 of 3";
  static const String identityVerification = "Identity Verification";

  // Step 1
  static const String tellUsAboutYourself = "Tell Us About Yourself";
  static const String alfredRequiresDetails =
      "Alfred requires a few details to tailor\nyour private estate experience\nprecisely to your lifestyle.";
  static const String eGName = "E.g. Alexander Hamilton";
  static const String age = "Age";
  static const String years = "Years";
  static const String gender = "Gender";
  static const String select = "Select";
  static const String location = "Location";
  static const String currentCity = "Current City";
  static const String dataEncryptionActive = "Data Encryption Active";
  static const String encryptionDesc =
      "Your personal details are secured with\nbank-grade encryption and never shared\nwith third parties.";

  // Step 2
  static const String whatDoYouEnjoy = "What Do You Enjoy?";
  static const String selectYourInterests =
      "Select your interests to help Alfred\ncurate your perfect experience.";
  static const String coffeeDates = "Coffee Dates";
  static const String movies = "Movies";
  static const String fineDining = "Fine Dining";
  static const String travel = "Travel";
  static const String adventure = "Adventure";
  static const String sports = "Sports";
  static const String nature = "Nature";
  static const String museums = "Museums";
  static const String luxuryExperiences = "Luxury Experiences";

  // Step 3
  static const String preferredDateBudget = "Preferred Date Budget";
  static const String helpsAlfredTailor =
      "This helps Alfred tailor\nrecommendations to your lifestyle.";
  static const String casual = "Casual";
  static const String casualPrice = "\$20–\$50";
  static const String standard = "Standard";
  static const String standardPrice = "\$50–\$100";
  static const String premiumBudget = "Premium";
  static const String premiumPrice = "\$100–\$300";
  static const String exceptional = "Exceptional";
  static const String exceptionalPrice = "\$300+";
  static const String enterCustomAmount = "Enter custom amount";
  static const String customAmountHint = "\$ 0.00";

  ///========================== Home / Generic =====================//
  static const String home = "Home";
  static const String plans = "Plans";
  static const String discovery = "Discovery";
  static const String calender = "Calender";
  static const String profile = "Profile";
  static const String goodEveningName = "Good Evening, Carl";
  static const String organizedSchedule = "I have organized your upcoming schedule.";
  static const String askAlfred = "Ask Alfred anything...";
  static const String suggestions = "SUGGESTIONS";
  static const String planADate = "Plan A Date";
  static const String dateIdeas = "Date Ideas";
  static const String nextEvent = "NEXT EVENT";
  static const String eliteTag = "ELITE";
  static const String sampleEventTitle = "Private Gallery Tour";
  static const String sampleEventTime = "7:00 PM";
  static const String sampleEventLocation = "The Modern Wing";
  static const String goodEvening = "Good Evening";
  static const String myProperties = "My Properties";
  static const String serciceBookings = "Sercice Bookings";
  static const String guestManagement = "Guest Management";
  static const String myEarning = "My Earning";
  static const String addProfile = "Add Profile";

  ///========================== Salon Details =====================//
  static const String premium = "PREMIUM";
  static const String bookASeat = "BOOK A SEAT";
  static const String about = "ABOUT";
  static const String services = "SERVICES";
  static const String viewAll = "VIEW ALL";
  static const String locationUppercase = "LOCATION";

  ///========================== Booking Screen =====================//
  static const String haircut = "Haircut";
  static const String premiumHaircut = "Premium Haircut";
  static const String today = "Today";
  static const String tomorrow = "Tomorrow";
  static const String phoneNumber = "Phone Number";
  static const String notesOptional = "Notes (Optional)";
  static const String requestBooking = "Request Booking";
  static const String enterFullName = "e.g. John Doe";
  static const String enterPhoneNumber = "+1 (555) 000-0000";
  static const String enterNotes = "Any special requests or details...";

  ///========================== Booking Status Screen =====================//
  static const String bookingStatus = "Booking Status";
  static const String requested = "Requested";
  static const String sentOn = "Sent on Oct 10, 10:30 AM";
  static const String confirmed = "Confirmed";
  static const String waitingForProvider = "Waiting for provider";
  static const String pendingApproval = "PENDING APPROVAL";
  static const String classicMensHaircut = "Classic Men's Haircut";
  static const String theGoldenScissors = "The Golden Scissors Barber Saloon";
  static const String dummyProviderName = "Marcus Thorne";
  static const String dummyProviderRating = "5.0 (482 reviews)";
  static const String thursdayOct24 = "Thursday, Oct 24, 2024";
  static const String timeRange3To345 = "3:00 PM - 3:45 PM";
  static const String dummyAddress2 = "452 Grooming Ave, Suite 102, NY";
  static const String cancelRequest = "Cancel Request";
  static const String providerRespondsWithin =
      "The provider usually responds within 2 hours.";
  static const String whatHappensNext = "What happens next?";

  ///========================== My Bookings Screen =====================//
  static const String myBookings = "My Bookings";
  static const String upcoming = "Upcoming";
  static const String history = "History";
  static const String currentBookings = "CURRENT BOOKINGS";
  static const String sereneSpa = "Serene Spa & Wellness";
  static const String deepTissueMassage = "Deep Tissue Massage";
  static const String elitePerformance = "Elite Performance Lab";
  static const String personalTraining = "Personal Training Session";
  static const String radiantYoga = "Radiant Yoga Studio";
  static const String advancedVinyasa = "Advanced Vinyasa Flow";
  static const String completed = "COMPLETED";
  static const String viewDetails = "View Details >";
  static const String rebook = "Rebook";

  ///========================== Booking Details Screen =====================//
  static const String bookingDetails = "Booking Details";
  static const String confirmedGreen = "CONFIRMED";
  static const String bookingConfirmedDesc =
      "Your booking is confirmed. Please arrive at least 10 minutes early to complete any necessary paperwork.";
  static const String locationTitle = "Location";
  static const String getDirections = "Get Directions";
  static const String dummyMapSalonName = "City Health Medical Center";
  static const String dummyMapAddress = "123 Wellness Way, Suite 400";
  static const String rescheduleBooking = "Reschedule Booking";

  ///========================== Profile Screen =====================//
  static const String myProfile = "My Profile";
  static const String profileInformation = "Profile information";
  static const String editProfile = "Edit Profile";
  static const String accountSettings =
      "Account Settings"; // user typo Account Seetings
  static const String accountSettingsTitle =
      "Account Settings"; // Intentionally correcting typo. If user design has typo, we usually fix it unless asked not to, but the image title says Account Seetings and option says Account Settings. We'll use "Account Settings" for option and title. Let's provide both if needed, but standard is correct spelling.
  static const String accountSettingsTypo = "Account Seetings";
  static const String notification = "Notification";
  static const String logout = "Logout";
  static const String dummyUserName = "John smith";
  static const String dummyUserRole = "Provider";

  ///========================== Edit Profile =====================//
  static const String tapToChangePhoto = "Tap to change photo";
  static const String name = "Name";
  static const String dateOfBirth = "Date of Birth";
  static const String country = "Country";
  static const String save = "Save";

  ///========================== Account Settings =====================//
  static const String changePassword = "Change Password";
  static const String termsOfServices = "Terms of services";
  static const String aboutUs = "About us";
  static const String deleteAccount = "Delete Account";

  ///========================== Change Password =====================//
  static const String currentPassword = "Current Password";
  static const String newPasswordProfile =
      "New Password"; // Already have newPassword but just in case
  static const String confirmPasswordProfile = "Confirm Password";

  ///========================== Terms =====================//
  static const String termsOfConditions = "Terms of Conditions";
  static const String dummyTerms =
      "Lorem ipsum dolor sit amet consectetur. Imperdiet iaculis convallis bibendum massa id elementum consectetur neque mauris.";

  ///========================== Provider Build Profile =====================//
  static const String buildYourProfile = "Build your profile";
  static const String buildProfileDesc =
      "Let's set up your digital storefront. This is how clients will see you on 2Seats.";
  static const String uploadLogo = "UPLOAD LOGO";
  static const String shopBusinessName = "SHOP / BUSINESS NAME";
  static const String shopBusinessHint = "e.g. Red Diamond Parlor";
  static const String category = "CATEGORY";
  static const String city = "CITY";
  static const String searchYourCity = "Search your city";
  static const String shortAboutDescription = "SHORT ABOUT DESCRIPTION";
  static const String aboutDescHint =
      "Tell your clients what makes your service unique...";
  static const String completeSetup = "Complete Setup";
  static const String youCanChangeTheseDetails =
      "YOU CAN CHANGE THESE DETAILS LATER IN SETTINGS";

  ///========================== Provider Home Screen =====================//
  static const String goodMorning = "Good Morning,";
  static const String providerUserName = "Alex";
  static const String readyForYourBusyDay = "Ready for your busy day?";
  static const String membershipLabel = "Membership";
  static const String bronze = "Bronze";
  static const String pendingRequests = "Pending Requests";
  static const String rating = "Rating";
  static const String upcomingBookings = "Upcoming Bookings";

  // Dummy booking data
  static const String sarahJenkins = "Sarah Jenkins";
  static const String classicLashSet = "Classic Lash Set";
  static const String michaelRivera = "Michael Rivera";
  static const String fullBeardGrooming = "Full Beard Grooming";
  static const String emilyDavis = "Emily Davis";
  static const String hybridLashFill = "Hybrid Lash Fill";
  static const String pending = "PENDING";

  ///========================== Membership Screen =====================//
  static const String membership = "Membership";
  static const String upgradeYourImpact = "Upgrade Your Impact";
  static const String upgradeYourImpactDesc =
      "Choose a premium tier to unlock advanced tools and connect with more customers instantly.";

  static const String freeTrial = "FREE TRIAL";
  static const String start14DayTrial = "Start 14-Day Trial";
  static const String basicProfileVisibility = "Basic profile visibility";
  static const String standardLeadResponse = "Standard lead response";
  static const String verifiedBadge = "Verified Badge";

  static const String silver = "SILVER";
  static const String subscribeNow = "Subscribe Now";
  static const String increasedSearchVisibility = "Increased search visibility";
  static const String essentialMarketingTools = "Essential marketing tools";
  static const String emailSupport = "Email support (24h)";

  static const String recommended = "RECOMMENDED";
  static const String gold = "GOLD";
  static const String getPriorityAccess = "Get Priority Access";
  static const String priorityVisibility = "Priority Visibility (Top 3)";
  static const String advancedLeadAnalytics = "Advanced Lead Analytics";
  static const String customProfileBrandedPage = "Custom Profile Branded Page";
  static const String instantChatWithLeads = "Instant Chat with Leads";

  static const String platinum = "PLATINUM";
  static const String elite = "ELITE";
  static const String joinTheElite = "Join the Elite";
  static const String maximumGlobalExposure = "Maximum Global Exposure";
  static const String dedicatedAccountManager = "Dedicated Account Manager";
  static const String earlyAccessToBetaFeatures =
      "Early Access to Beta Features";
  static const String zeroBookingCommissions = "Zero Booking Commissions";

  static const String getTheVerifiedBadge = "Get the Verified Badge";
  static const String verifiedBadgeDesc =
      "Verified providers see an average 85% increase in customer trust and a 2x higher conversion rate on leads.";
  static const String learnMoreAboutVerification =
      "LEARN MORE ABOUT VERIFICATION";

  ///========================== Provider Bookings =====================//
  static const String pendingRequest = "Pending Request";
  static const String providerAvailability = "Provider Availability";
  static const String upcomingBookingsTab = "Upcoming Bookings";
  static const String requests = "Requests";
  static const String availability = "Availability";
  static const String newRequests = "New Requests";
  static const String accept = "Accept";
  static const String decline = "Decline";
  static const String availableToday = "Available Today";
  static const String acceptingNewAppointments = "Accepting new appointments";
  static const String todaysSchedule = "Today's Schedule";
  static const String slotsActive = "SLOTS ACTIVE";
  static const String overlapsWithMorningSession =
      "Overlaps with Morning Session";
  static const String customersCanOnlyBookYou =
      "Customers can only book you during these active time slots. Make sure to account for travel time between locations.";
  static const String addNewTimeSlot = "Add New Time Slot";
  static const String morningSession = "Morning Session";
  static const String lunchSession = "Lunch Session";
  static const String afternoonBlock = "Afternoon Block";
  static const String thisWeek = "This Week";
  static const String allBookings = "All Bookings";
  static const String totalBookingsToday = "Total Bookings Today: ";
  static const String viewAppointmentDetails = "View Appointment Details";
  static const String optimizeRouteToday = "Optimize Route Today";

  ///========================== Provider Services =====================//
  static const String ourServices = "Our Services";
  static const String searchForAService = "Search for a service";
  static const String allServices = "All Services";
  static const String barber = "Barber";
  static const String lashes = "Lashes";
  static const String massage = "Massage";
  static const String facial = "Facial";

  ///========================== Add Service Flow =====================//
  static const String addService = "Add Service";
  static const String serviceDetails = "Service Details";
  static const String defineSpecifics =
      "Define the specifics of your luxury offering.";
  static const String serviceNameAllCaps = "SERVICE NAME";
  static const String serviceNameHint = "e.g. Signature Bridal Transformation";
  static const String serviceNameSub =
      "This will be the main title clients see on your profile.";
  static const String priceAllCaps = "PRICE";
  static const String priceHint = "75.00";
  static const String priceSub = "Visible to clients during booking.";
  static const String durationAllCaps = "DURATION";
  static const String durationHint = "60";
  static const String durationUnit = "Minutes";
  static const String durationSub = "Estimated time for the appointment.";
  static const String coverImage = "COVER IMAGE";
  static const String uploadHighResPreview = "Upload a high-resolution preview";
  static const String saveAndContinue = "Save & Continue";
  static const String luxuryClientsValueTransparency =
      "Luxury clients value transparency. High-quality descriptions and clear pricing increase booking rates by ";

  static const String defineYourCapacity = "Define your capacity";
  static const String howManyBookingsCanYouAccept =
      "How many bookings can you accept per time slot?";
  static const String seats = "SEATS";
  static const String settingCapacityHelpsYouManageFlow =
      "Setting a capacity helps you manage your flow and avoid overbooking during peak hours.";
  static const String confirmCapacity = "Confirm Capacity";

  static const String seatAvailability = "Seat Availability";
  static const String noSlotsAddedYet = "No slots added yet";
  static const String providersWithTomorrowSlotsGetMore =
      "Providers with tomorrow slots get 30% more bookings.";
  static const String addAvailability = "ADD AVAILABILITY";
  static const String copyFromToday = "Copy from Today";
  static const String standard9To5 = "Standard 9-5";
  static const String saturday = "Saturday";
  static const String saveAvailability = "Save Availability";
  static const String visibleToClientsImmediatelyAfterSaving =
      "VISIBLE TO CLIENTS IMMEDIATELY AFTER SAVING";
  static const String addSlot = "Add Slot";

  static const String serviceIsLive = "Service is Live!";
  static const String yourServiceHasBeenSuccessfullyPublished =
      "Your service has been successfully published and is now visible to clients in the marketplace.";
  static const String backToDashboard = "Back to Dashboard";
  static const String viewServiceList = "View Service List";
}