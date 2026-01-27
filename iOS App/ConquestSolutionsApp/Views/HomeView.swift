//
//  HomeView.swift
//  ConquestSolutionsApp
//
//  Created for Conquest Solutions
//

import SwiftUI

struct HomeView: View {
    @StateObject private var clerkManager = ClerkManager()
    @State private var showSignOutConfirmation = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Welcome Section
                    VStack(spacing: 8) {
                        Text("Welcome")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("How can we help you today?")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 20)
                    
                    // Call Button - Primary Action
                    CallButton()
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                    
                    // Future Features Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Support Services")
                            .font(.headline)
                            .padding(.horizontal, 20)
                        
                        // Placeholder for Submit Ticket
                        NavigationLink(destination: TicketSubmissionView()) {
                            FeatureCard(
                                icon: "ticket.fill",
                                title: "Submit a Ticket",
                                description: "Request technical support",
                                color: .green
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        // Placeholder for Maintenance Request
                        NavigationLink(destination: MaintenanceRequestView()) {
                            FeatureCard(
                                icon: "wrench.and.screwdriver.fill",
                                title: "Maintenance Request",
                                description: "Request special maintenance services",
                                color: .orange
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.top, 20)
                    
                    Spacer(minLength: 40)
                }
            }
            .navigationTitle("Conquest Solutions")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(role: .destructive, action: {
                            showSignOutConfirmation = true
                        }) {
                            Label("Sign Out", systemImage: "arrow.right.square")
                        }
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
            }
            .confirmationDialog("Sign Out", isPresented: $showSignOutConfirmation, titleVisibility: .visible) {
                Button("Sign Out", role: .destructive) {
                    Task {
                        await clerkManager.signOut()
                    }
                }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Are you sure you want to sign out?")
            }
        }
    }
}

struct FeatureCard: View {
    let icon: String
    let title: String
    let description: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
                .frame(width: 50, height: 50)
                .background(color.opacity(0.1))
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 20)
    }
}

#Preview {
    HomeView()
}
