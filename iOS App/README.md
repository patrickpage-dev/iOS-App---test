# Conquest Solutions iOS App

A native iOS app built with SwiftUI for Conquest Solutions client support. The app provides one-click calling to Conquest Solutions' main number and will support ticket submission and maintenance requests in future updates.

**Repository:** [https://github.com/patrickpage-dev/iOS-App---test](https://github.com/patrickpage-dev/iOS-App---test)

## Current Status

✅ **Project Structure**: Complete  
✅ **One-Click Calling**: Implemented  
✅ **Authentication UI**: Complete  
⚠️ **Clerk Integration**: Requires Clerk SDK setup (see CLERK_SETUP.md)  
🔜 **Ticket Submission**: Placeholder ready  
🔜 **Maintenance Requests**: Placeholder ready

## Features

- ✅ **One-Click Calling**: Instantly call Conquest Solutions at (770) 953-2500
- ✅ **Clerk Authentication**: Secure sign-in with domain-restricted access
- 🔜 **Submit Tickets**: Request technical support (Coming Soon)
- 🔜 **Maintenance Requests**: Submit special maintenance requests (Coming Soon)

## Requirements

- iOS 15.0 or later
- Xcode 14.0 or later
- Swift 5.7 or later
- Clerk account and publishable key

## Setup Instructions

### 1. Create Xcode Project

Since this project structure was created on Windows, you'll need to create the Xcode project on a Mac:

1. Open Xcode
2. Select **File > New > Project**
3. Choose **iOS > App**
4. Configure:
   - **Product Name**: `ConquestSolutionsApp`
   - **Interface**: SwiftUI
   - **Language**: Swift
   - **Bundle Identifier**: `com.conquestsolutions.app` (or your preferred identifier)
   - **Minimum Deployment**: iOS 15.0
5. Save the project in this directory (or clone this repository and work from there)

### 2. Add Source Files to Xcode

1. In Xcode, right-click on the project navigator
2. Select **Add Files to "ConquestSolutionsApp"...**
3. Add all files from the `ConquestSolutionsApp` folder:
   - `ConquestSolutionsApp.swift` (replace the default file)
   - All files in `Views/` folder
   - All files in `Services/` folder
   - All files in `Utilities/` folder
   - All files in `Models/` folder (if any)

### 3. Configure Info.plist

1. In Xcode, select your project in the navigator
2. Select your target
3. Go to the **Info** tab
4. Add the phone call usage description:
   - Key: `Privacy - Phone Call Usage Description`
   - Value: `This app needs access to make phone calls to contact Conquest Solutions support.`

Alternatively, you can use the provided `Info.plist` file in the root directory.

### 4. Install Clerk SDK

1. In Xcode, select your project
2. Go to **File > Add Package Dependencies...**
3. Add the Clerk iOS SDK:
   - URL: `https://github.com/clerk/clerk-ios`
   - Version: Latest stable version
4. Add the package to your target

### 5. Configure Clerk

1. Sign up or log in to [Clerk Dashboard](https://dashboard.clerk.com)
2. Create a new application or select an existing one
3. Go to **API Keys** and copy your **Publishable Key**
4. In Xcode, open `ConquestSolutionsApp/Utilities/Constants.swift`
5. Replace `pk_test_YOUR_KEY_HERE` with your actual Clerk publishable key:
   ```swift
   static let clerkPublishableKey = "pk_test_your_actual_key_here"
   ```

### 6. Configure Domain Restrictions in Clerk

1. In Clerk Dashboard, go to **Settings > Restrictions**
2. Configure email domain allowlist:
   - Add domains for property managers, HOAs, and building engineers
   - Example: `example.com`, `hoa.org`, etc.
3. Enable invitation system:
   - Go to **Settings > User Management**
   - Enable email invitations

### 7. Update ClerkManager.swift

The `ClerkManager.swift` file contains placeholder code for Clerk SDK integration. You'll need to update it based on the actual Clerk iOS SDK API. Refer to [Clerk iOS Documentation](https://clerk.com/docs/quickstarts/ios) for the correct implementation.

Key areas to update:
- Clerk SDK initialization in `setupClerk()`
- Authentication state checking in `checkAuthState()`
- Sign in implementation in `signIn(email:password:)`
- Sign out implementation in `signOut()`

### 8. Build and Run

1. Connect an iOS device or start the iOS Simulator
2. Select your target device in Xcode
3. Press **Cmd + R** to build and run

## Project Structure

```
ConquestSolutionsApp/
├── ConquestSolutionsApp.swift      # App entry point
├── Views/
│   ├── SignInView.swift            # Authentication screen
│   ├── HomeView.swift              # Main screen with call button
│   ├── TicketSubmissionView.swift  # Future: Submit tickets
│   ├── MaintenanceRequestView.swift # Future: Maintenance requests
│   └── Components/
│       └── CallButton.swift        # Reusable call button
├── Services/
│   ├── ClerkManager.swift          # Authentication service
│   └── PhoneService.swift          # Phone call handling
├── Utilities/
│   └── Constants.swift             # App-wide constants
└── Models/                         # Data models (future)
```

## Configuration

### Phone Number

The main phone number is configured in `Constants.swift`:
- `mainPhoneNumber`: `"7709532500"`
- `formattedPhoneNumber`: `"(770) 953-2500"`

### Allowed Email Domains

Configure allowed email domains in `Constants.swift`:
```swift
static let allowedDomains: [String] = [
    "example.com",
    "hoa.org",
    // Add your allowed domains
]
```

Note: If the array is empty, domain validation will be handled by Clerk's dashboard configuration.

## Testing

### Test Phone Calls
- Phone calls can only be tested on a physical iOS device
- The iOS Simulator does not support phone calls
- Ensure the device has cellular service or is connected to Wi-Fi calling

### Test Authentication
1. Create test users in Clerk Dashboard
2. Use email addresses from allowed domains
3. Test sign-in flow
4. Test domain restriction by attempting sign-in with non-allowed domains

## Future Features

The app includes placeholder views for future features:
- **Ticket Submission**: Submit technical support tickets
- **Maintenance Requests**: Request special maintenance services

These views are currently placeholders and will be implemented in future updates.

## Support

For issues or questions:
- Contact: Conquest Solutions
- Phone: (770) 953-2500
- Website: https://csatlanta.com/

## License

Copyright © 2024 Conquest Solutions. All rights reserved.
