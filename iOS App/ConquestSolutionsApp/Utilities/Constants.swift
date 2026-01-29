//
//  Constants.swift
//  ConquestSolutionsApp
//
//  Created for Conquest Solutions
//

import Foundation
import SwiftUI

struct Constants {
    // Phone number for one-click calling
    static let mainPhoneNumber = "7709532500"
    static let formattedPhoneNumber = "(770) 953-2500"
    
    // Clerk Configuration
    // Note: Replace with your actual Clerk publishable key
    static let clerkPublishableKey = "pk_test_YOUR_KEY_HERE"
    
    // Allowed email domains for authentication
    // These should match your Clerk domain allowlist configuration
    static let allowedDomains: [String] = [
        // Add your allowed domains here
        // Example: "example.com", "hoa.org"
    ]
    
    // Brand Colors - Conquest Solutions Red
    // RGB: (220, 38, 38) or #DC2626 - matches website red
    static let brandRed = Color(red: 220/255, green: 38/255, blue: 38/255)
    static let brandRedDark = Color(red: 185/255, green: 28/255, blue: 28/255)
    
    // Logo and Assets
    static let logoImageName = "ConquestSolutionsLogo"
}
