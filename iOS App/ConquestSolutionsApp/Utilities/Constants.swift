//
//  Constants.swift
//  ConquestSolutionsApp
//
//  Created for Conquest Solutions
//

import Foundation

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
}
