//
//  ClerkManager.swift
//  ConquestSolutionsApp
//
//  Created for Conquest Solutions
//

import Foundation
import ClerkSDK

@MainActor
class ClerkManager: ObservableObject {
    @Published var isSignedIn = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var clerk: Clerk?
    
    init() {
        setupClerk()
    }
    
    private func setupClerk() {
        // Initialize Clerk with your publishable key
        // Note: Replace with your actual Clerk publishable key from Constants
        let publishableKey = Constants.clerkPublishableKey
        
        guard !publishableKey.contains("YOUR_KEY_HERE") else {
            print("Warning: Clerk publishable key not configured. Please update Constants.swift")
            return
        }
        
        // Clerk SDK initialization
        // The actual initialization will depend on the Clerk iOS SDK version
        // This is a placeholder structure - adjust based on Clerk SDK documentation
        Task {
            do {
                // Initialize Clerk SDK
                // Example: Clerk.shared.configure(publishableKey: publishableKey)
                // Check authentication state
                await checkAuthState()
            } catch {
                errorMessage = "Failed to initialize Clerk: \(error.localizedDescription)"
            }
        }
    }
    
    func checkAuthState() async {
        isLoading = true
        defer { isLoading = false }
        
        // Check if user is signed in
        // This will depend on Clerk SDK implementation
        // Example: isSignedIn = Clerk.shared.user != nil
    }
    
    func signIn(email: String, password: String) async throws {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        // Validate email domain if needed
        if !isEmailDomainAllowed(email) {
            throw AuthError.domainNotAllowed
        }
        
        // Sign in with Clerk
        // Example: try await Clerk.shared.signIn(email: email, password: password)
        // await checkAuthState()
    }
    
    func signOut() async {
        isLoading = true
        defer { isLoading = false }
        
        // Sign out from Clerk
        // Example: try await Clerk.shared.signOut()
        isSignedIn = false
    }
    
    private func isEmailDomainAllowed(_ email: String) -> Bool {
        // Extract domain from email
        guard let domain = email.components(separatedBy: "@").last?.lowercased() else {
            return false
        }
        
        // Check against allowed domains
        // If no domains are specified in Constants, allow all (Clerk will handle domain restrictions)
        if Constants.allowedDomains.isEmpty {
            return true
        }
        
        return Constants.allowedDomains.contains { allowedDomain in
            domain == allowedDomain.lowercased() || domain.hasSuffix(".\(allowedDomain.lowercased())")
        }
    }
}

enum AuthError: LocalizedError {
    case domainNotAllowed
    case invalidCredentials
    case networkError
    
    var errorDescription: String? {
        switch self {
        case .domainNotAllowed:
            return "Your email domain is not authorized to access this app. Please contact support for access."
        case .invalidCredentials:
            return "Invalid email or password. Please try again."
        case .networkError:
            return "Network error. Please check your connection and try again."
        }
    }
}
