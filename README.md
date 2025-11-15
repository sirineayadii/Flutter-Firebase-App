# Flutter Firebase App

A Flutter task management application with Firebase authentication and backend services.

## Prerequisites

- Flutter SDK (3.5.1 or higher)
- Dart SDK
- Firebase account
- Android Studio / Xcode (for mobile development)

## Firebase Setup

⚠️ **Important:** This project requires Firebase configuration to run.

Before running the app, you must configure Firebase with your own credentials. See [FIREBASE_SETUP.md](FIREBASE_SETUP.md) for detailed setup instructions.

## Getting Started

1. **Set up Firebase** - Follow the instructions in [FIREBASE_SETUP.md](FIREBASE_SETUP.md)

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## Features

- User authentication (Email/Password)
- Task management
- Firebase integration

## Security

This project uses Firebase for authentication and backend services. All sensitive Firebase configuration files are excluded from version control to protect API keys and credentials.

Never commit the following files:
- `firebase.json`
- `lib/firebase_options.dart`
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase for Flutter](https://firebase.google.com/docs/flutter/setup)
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
