# HemoGlobe🎯


## HemoGlobe is a Blood Bank dedicated platform designed to seamlessly connect blood donors and accepters without any hassle. Whether you're in need or ready to give, th app makes the process easy, secure, and efficient.
### Team Name: Kandam Girls


### Team Members
- Member 1: Diya S Nair - GEC Thrissur
- Member 2: Sivakami Matheth - GEC Thrissur
- Member 3: Sreemrudu K P - GEC Thrissur

### Hosted Project Link
https://github.com/SreemruduKP/hemoglobe.git

### Project Description
1. Donor and Acceptor Registration: Easy sign-up for donors and acceptors with their details and blood type.
2. Blood Type Matching: Instant blood compatibility check between donors and recipients.
3. Emergency Request: Instant alerts to nearby donors for urgent blood requirements.
4. Donor Rewarding System: Points or badges for frequent donors to gamify the experience.
5. Donation History: Automatic update of donation history data.
6. Request Alerts: Alerts when specific acceptors request you for blood.
7. Health Tips Section: Useful tips and info for donors on staying healthy.

### The Problem statement
Finding and connecting compatible blood donors with recipients is often a time-sensitive, inefficient, and cumbersome process, especially during emergencies. Traditional blood donation systems lack real-time connectivity, transparency, and engagement, leading to delays and a shortage of available blood. This inefficiency impacts lives, particularly in urgent cases where timely blood transfusions are critical.

### The Solution
We’re solving the problem with HemoGlobe, a platform that connects blood donors and recipients seamlessly. It matches compatible donors instantly, sends emergency alerts to nearby heroes, and keeps donors engaged with rewards, reminders, and real-time blood shortage updates. With HemoGlobe, saving lives is fast, easy, and even fun!


## Technical Details
### Technologies/Components Used

For Software:

Languages Used:
Dart (primary programming language)
YAML (for configuration)

Frameworks Used:
Flutter (main framework for cross-platform development)
Material Design (UI design framework)

Libraries/Packages Used:
flutter/material.dart (core Flutter widgets)
firebase_core (Firebase initialization)
firebase_auth (authentication)
cloud_firestore (database)
google_fonts (custom typography)
flutter_svg (for SVG images)
provider (state management)

Development Tools:
Android Studio/VS Code (IDE)
Flutter SDK
Dart SDK
Git (version control)
Firebase Console (backend management)
Flutter DevTools (debugging)

For Hardware:

Device Requirements:
Smartphone (Android/iOS) or Tablet
Minimum 2GB RAM
At least 50MB storage space
Internet connectivity (WiFi/Mobile Data)

Development Hardware:
Computer/Laptop for development
Minimum 8GB RAM recommended
Modern processor (i5/equivalent or better)
At least 10GB free storage

Testing Tools:
Physical Android/iOS devices
Android/iOS emulators/simulators
USB cable for device debugging

### Implementation
INSTALLATION

Prerequisites:
# Install Flutter SDK
https://docs.flutter.dev/get-started/install

# Install Git
https://git-scm.com/downloads

# Verify Flutter installation
flutter doctor

Project Setup:
# Clone the repository
git clone [your-repo-url]

# Navigate to project directory
cd blood-donation-app

# Get dependencies
flutter pub get

Firebase Setup:
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase in project
flutterfire configure

RUN

Development Mode:
# Check available devices
flutter devices

# Run the app in debug mode
flutter run

# Or specify a device
flutter run -d [device-id]

Build Release Version:
# For Android APK
flutter build apk

# For Android App Bundle
flutter build appbundle

# For iOS (on Mac only)
flutter build ios

Testing:
# Run tests
flutter test

# Run with coverage
flutter test --coverage



### Project Documentation
For Software:

Overview
A mobile application designed to connect blood donors with recipients, facilitating the blood donation process through a user-friendly interface.

Features
1.User Authentication
Role-based login (Donor/Acceptor)
Secure authentication using Firebase
Profile management
2.Donor Features
Profile creation with blood group info
Donation history tracking
Reward points system
Notification system for blood requests
Location-based donor search
3.Acceptor Features
Blood request creation
Blood group filtering
Emergency request options
Donor contact information access

Technical Architecture

Frontend
Framework: Flutter
State Management: Provider
UI Components: Material Design
Asset Management: SVG and static images

Backend
Platform: Firebase
Services Used:
Firebase Authentication
Cloud Firestore
Firebase Analytics

# Screenshots (Add at least 3)
![Screenshot 2025-01-26 111204](https://github.com/user-attachments/assets/350d228b-7e78-4b93-8a11-7e57d58d302d)

Registration screen with login and sign up options.

![Screenshot 2025-01-26 111228](https://github.com/user-attachments/assets/40c44cdc-5513-4e4d-90fe-36b02e6e60ea)

Role selection screen to choose your role either as a donor or an acceptor.

![Screenshot 2025-01-26 111243](https://github.com/user-attachments/assets/d374529a-07b3-4687-a45d-de31da927e06)

You can view the health tips for donors.

![Screenshot 2025-01-26 111306](https://github.com/user-attachments/assets/7b5081a1-8c93-4e6a-8fd1-e87fac5be95a)

Donor screen with donor details, donation history and personalised rewarding system using badges.

![Screenshot 2025-01-26 111334](https://github.com/user-attachments/assets/e31c9284-913f-4bac-a841-b68d85617842)

Acceptor screen with various filters, emergency request, and option to send requests to available donors.

![Screenshot 2025-01-26 111351](https://github.com/user-attachments/assets/7dec9a99-4e0d-4b3a-adb6-524b6b394955)

Notification alert option in donor screen with option to accept and decline requests.



# Diagrams
lib/
├── main.dart
├── config/
│   └── firebase_config.dart
├── models/
│   ├── user_model.dart
│   └── donation_model.dart
├── screens/
│   ├── donor_screen.dart
│   ├── acceptor_screen.dart
│   └── role_selection.dart
├── widgets/
│   ├── custom_button.dart
│   └── blood_group_card.dart
└── services/
    ├── auth_service.dart
    └── database_service.dart



### Project Demo
# Video
https://drive.google.com/file/d/1E4l9ylIEiPvl8Bhjw9t25Ae4bd0JbTh0/view?usp=drivesdk


HemoGlobe is a user-friendly Blood Bank platform that bridges the gap between blood donors and recipients, ensuring a hassle-free, secure, and efficient experience. Key features include:

1. Seamless Donor Registration: Quick and easy sign-up with essential details and blood type.
2. Smart Blood Type Matching: Instantly checks compatibility between donors and recipients.
3. Emergency Broadcast System: Sends instant alerts to nearby donors during urgent blood needs.
4. Donor Reputation System: Rewards frequent donors with points or badges, encouraging continued participation.
5. Automated Donation Reminders: Notifies donors when they’re eligible to donate again.
6. Blood Shortage Alerts: Real-time notifications for specific blood type shortages at local blood banks.
7. Health & Wellness Tips: A dedicated section with guidance for donors to maintain their health.

Key Challenges Being Solved:

1. Inefficiency in Matching Donors and Recipients: The lack of an automated system to identify compatible blood donors quickly.
2. Delayed Response During Emergencies: No real-time mechanism to alert nearby donors for urgent needs.
3. Donor Engagement and Retention: Difficulty in encouraging and retaining donors over time.
4. Lack of Awareness About Blood Availability: Limited visibility into blood type shortages in local blood banks.
5. Health Knowledge Gap for Donors: Donors often lack guidance on staying healthy and maintaining eligibility to donate.

HemoGlobe provides a modern, tech-driven solution to ensure faster, seamless, and more reliable blood donation and transfusion services, saving lives while fostering an engaged donor community.



## Team Contributions
- Diya S Nair: Content, Design, Flutter Developer
- Sivakami Matheth: Content, Flutter Developer
- Sreemrudu K P: Design, Flutter Developer

---
Made with ❤️ at TinkerHub
