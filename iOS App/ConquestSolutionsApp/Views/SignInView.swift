//
//  SignInView.swift
//  ConquestSolutionsApp
//
//  Created for Conquest Solutions
//

import SwiftUI
import UIKit

struct SignInView: View {
    @StateObject private var clerkManager = ClerkManager()
    @State private var email = ""
    @State private var password = ""
    @State private var showError = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            VStack(spacing: 16) {
                // Logo Image - add ConquestSolutionsLogo.png to your project
                // If logo is not found, fallback to system icon
                Group {
                    if UIImage(named: Constants.logoImageName) != nil {
                        Image(Constants.logoImageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 80)
                    } else {
                        // Fallback icon until logo is added
                        Image(systemName: "building.2.fill")
                            .font(.system(size: 60))
                            .foregroundColor(Constants.brandRed)
                    }
                }
                
                Text("Conquest Solutions")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Constants.brandRed)
                
                Text("Client Support Portal")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.top, 60)
            .padding(.bottom, 40)
            
            // Sign In Form
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    TextField("your.email@example.com", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Password")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.password)
                }
                
                if clerkManager.isLoading {
                    ProgressView()
                        .padding(.top, 10)
                } else {
                    Button(action: signIn) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Constants.brandRed)
                            .cornerRadius(12)
                    }
                    .padding(.top, 10)
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            // Footer
            VStack(spacing: 8) {
                Text("Need access? Contact your administrator")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("Conquest Solutions")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
            }
            .padding(.bottom, 40)
        }
        .alert("Error", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(clerkManager.errorMessage ?? "An error occurred. Please try again.")
        }
        .onChange(of: clerkManager.errorMessage) { newValue in
            showError = newValue != nil
        }
    }
    
    private func signIn() {
        Task {
            do {
                try await clerkManager.signIn(email: email, password: password)
            } catch {
                clerkManager.errorMessage = error.localizedDescription
            }
        }
    }
}

#Preview {
    SignInView()
}
