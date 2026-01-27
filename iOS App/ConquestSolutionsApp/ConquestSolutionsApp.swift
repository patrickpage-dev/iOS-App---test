//
//  ConquestSolutionsApp.swift
//  ConquestSolutionsApp
//
//  Created for Conquest Solutions
//

import SwiftUI

@main
struct ConquestSolutionsApp: App {
    @StateObject private var clerkManager = ClerkManager()
    
    init() {
        // Initialize Clerk SDK
        // This will be configured based on your Clerk setup
        setupAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            Group {
                if clerkManager.isSignedIn {
                    HomeView()
                        .environmentObject(clerkManager)
                } else {
                    SignInView()
                        .environmentObject(clerkManager)
                }
            }
            .task {
                // Check authentication state on app launch
                await clerkManager.checkAuthState()
            }
        }
    }
    
    private func setupAppearance() {
        // Customize app appearance if needed
        // Example: UINavigationBar.appearance().tintColor = .systemBlue
    }
}
