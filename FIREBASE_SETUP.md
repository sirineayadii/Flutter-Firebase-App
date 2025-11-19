# Firebase Setup Instructions

This project uses Firebase for authentication and backend services. To run this project, you need to configure Firebase with your own credentials.

## Setup Steps

### 1. Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or use an existing one
3. Enable Authentication (Email/Password)

### 2. Configure Firebase for Flutter

#### Option A: Using FlutterFire CLI (Recommended)

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase for your project
flutterfire configure
```

This will automatically:
- Create `lib/firebase_options.dart`
- Generate `android/app/google-services.json` for Android
- Generate `ios/Runner/GoogleService-Info.plist` for iOS

#### Option B: Manual Configuration

1. **For Android:**
   - In Firebase Console, add an Android app
   - Download `google-services.json`
   - Place it in `android/app/`

2. **For iOS:**
   - In Firebase Console, add an iOS app
   - Download `GoogleService-Info.plist`
   - Place it in `ios/Runner/`

3. **Create firebase_options.dart:**
   - Copy configuration from Firebase Console
   - Create `lib/firebase_options.dart` with your Firebase configuration

4. **Update firebase.json:**
   - Copy `firebase.json.example` to `firebase.json`
   - Replace placeholder values with your actual Firebase project details

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Run the App

```bash
flutter run
```

## Important Security Notes

⚠️ **Never commit the following files to version control:**
- `firebase.json`
- `lib/firebase_options.dart`
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`
- `.env` files

These files contain sensitive API keys and should remain in your `.gitignore`.

## Troubleshooting

If you encounter build errors:
1. Make sure all Firebase configuration files are in place
2. Run `flutter clean` and `flutter pub get`
3. Verify your Firebase project settings match the configuration files
