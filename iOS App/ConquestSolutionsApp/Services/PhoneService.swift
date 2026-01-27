//
//  PhoneService.swift
//  ConquestSolutionsApp
//
//  Created for Conquest Solutions
//

import Foundation
import UIKit

struct PhoneService {
    /// Initiates a phone call to the specified number
    /// - Parameter phoneNumber: The phone number to call (digits only, no formatting)
    static func makeCall(to phoneNumber: String) {
        // Remove any non-digit characters
        let cleanedNumber = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        // Create the tel: URL
        guard let phoneURL = URL(string: "tel://\(cleanedNumber)") else {
            print("Error: Invalid phone number format")
            return
        }
        
        // Check if the device can make phone calls
        if UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        } else {
            print("Error: Device cannot make phone calls")
        }
    }
    
    /// Initiates a call to Conquest Solutions main number
    static func callConquestSolutions() {
        makeCall(to: Constants.mainPhoneNumber)
    }
}
