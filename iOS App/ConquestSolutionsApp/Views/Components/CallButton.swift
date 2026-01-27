//
//  CallButton.swift
//  ConquestSolutionsApp
//
//  Created for Conquest Solutions
//

import SwiftUI

struct CallButton: View {
    let phoneNumber: String
    let formattedNumber: String
    let action: () -> Void
    
    init(
        phoneNumber: String = Constants.mainPhoneNumber,
        formattedNumber: String = Constants.formattedPhoneNumber,
        action: @escaping () -> Void = { PhoneService.callConquestSolutions() }
    ) {
        self.phoneNumber = phoneNumber
        self.formattedNumber = formattedNumber
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: "phone.fill")
                    .font(.title2)
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Call Conquest Solutions")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(formattedNumber)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 20)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(16)
            .shadow(color: Color.blue.opacity(0.3), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    VStack(spacing: 20) {
        CallButton()
            .padding()
    }
    .padding()
}
