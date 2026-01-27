# Clerk Integration Setup Guide

This guide will help you complete the Clerk authentication integration in the Conquest Solutions iOS app.

## Prerequisites

1. Clerk account (sign up at https://clerk.com)
2. Clerk iOS SDK installed via Swift Package Manager
3. Your Clerk publishable key

## Step 1: Install Clerk SDK

1. In Xcode, go to **File > Add Package Dependencies...**
2. Enter the Clerk iOS SDK URL: `https://github.com/clerk/clerk-ios`
3. Select the latest stable version
4. Add to your target

## Step 2: Configure Clerk in Constants.swift

1. Open `ConquestSolutionsApp/Utilities/Constants.swift`
2. Replace `pk_test_YOUR_KEY_HERE` with your actual Clerk publishable key:
   ```swift
   static let clerkPublishableKey = "pk_test_your_actual_key_here"
   ```

## Step 3: Update ClerkManager.swift

The `ClerkManager.swift` file currently contains placeholder code. You need to update it with the actual Clerk SDK implementation.

### Current Implementation Status

The file structure is ready, but you need to replace placeholder code with actual Clerk SDK calls. Refer to the [Clerk iOS Documentation](https://clerk.com/docs/quickstarts/ios) for the exact API.

### Key Areas to Update

#### 1. Import Statement
```swift
import ClerkSDK
// or
import Clerk
// Check Clerk documentation for correct import
```

#### 2. Clerk Initialization in `setupClerk()`
Replace the placeholder with actual Clerk initialization:
```swift
private func setupClerk() {
    let publishableKey = Constants.clerkPublishableKey
    // Example (check Clerk docs for exact syntax):
    // Clerk.shared.configure(publishableKey: publishableKey)
}
```

#### 3. Authentication State Check in `checkAuthState()`
```swift
func checkAuthState() async {
    isLoading = true
    defer { isLoading = false }
    
    // Example:
    // if let user = Clerk.shared.user {
    //     isSignedIn = true
    // } else {
    //     isSignedIn = false
    // }
}
```

#### 4. Sign In in `signIn(email:password:)`
```swift
func signIn(email: String, password: String) async throws {
    isLoading = true
    errorMessage = nil
    defer { isLoading = false }
    
    // Validate email domain
    if !isEmailDomainAllowed(email) {
        throw AuthError.domainNotAllowed
    }
    
    // Example Clerk sign-in:
    // do {
    //     let result = try await Clerk.shared.signIn(
    //         identifier: email,
    //         password: password
    //     )
    //     await checkAuthState()
    // } catch {
    //     throw AuthError.invalidCredentials
    // }
}
```

#### 5. Sign Out in `signOut()`
```swift
func signOut() async {
    isLoading = true
    defer { isLoading = false }
    
    // Example:
    // try? await Clerk.shared.signOut()
    isSignedIn = false
}
```

## Step 4: Configure Domain Restrictions in Clerk Dashboard

1. Log in to [Clerk Dashboard](https://dashboard.clerk.com)
2. Select your application
3. Go to **Settings > Restrictions**
4. Configure email domain allowlist:
   - Add domains for property managers
   - Add domains for HOAs
   - Add domains for building engineers
5. Save changes

Alternatively, you can manage allowed domains in `Constants.swift`:
```swift
static let allowedDomains: [String] = [
    "propertymanager.com",
    "hoa.org",
    "buildingengineer.com"
]
```

## Step 5: Enable Invitations

1. In Clerk Dashboard, go to **Settings > User Management**
2. Enable **Email invitations**
3. Configure invitation templates if needed
4. Test invitation flow by sending an invitation from the dashboard

## Step 6: Test Authentication

1. Build and run the app on a device or simulator
2. Test sign-in with:
   - Allowed domain email (should work)
   - Non-allowed domain email (should show error)
   - Invalid credentials (should show error)
3. Test sign-out functionality
4. Test session persistence (close and reopen app)

## Troubleshooting

### "Clerk publishable key not configured" Warning
- Ensure you've updated `Constants.swift` with your actual key
- Verify the key starts with `pk_test_` or `pk_live_`

### Authentication Not Working
- Verify Clerk SDK is properly installed
- Check that ClerkManager initialization happens in `ConquestSolutionsApp.swift`
- Verify your publishable key is correct
- Check Clerk Dashboard for any errors or restrictions

### Domain Validation Issues
- Check `Constants.allowedDomains` array
- Verify Clerk Dashboard domain restrictions match
- Ensure email domain extraction logic is correct

## Resources

- [Clerk iOS Documentation](https://clerk.com/docs/quickstarts/ios)
- [Clerk iOS SDK GitHub](https://github.com/clerk/clerk-ios)
- [Clerk Dashboard](https://dashboard.clerk.com)

## Support

If you encounter issues:
1. Check Clerk documentation
2. Review Clerk Dashboard logs
3. Contact Clerk support if needed
4. Contact Conquest Solutions: (770) 953-2500
