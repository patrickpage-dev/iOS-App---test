//
//  MaintenanceRequestView.swift
//  ConquestSolutionsApp
//
//  Created for Conquest Solutions
//  Future Feature: Submit maintenance request
//

import SwiftUI

struct MaintenanceRequestView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "wrench.and.screwdriver.fill")
                .font(.system(size: 60))
                .foregroundColor(.orange)
            
            Text("Maintenance Request")
                .font(.title)
                .fontWeight(.bold)
            
            Text("This feature is coming soon!")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("You'll be able to submit special maintenance requests directly from the app.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .padding()
        .navigationTitle("Maintenance Request")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        MaintenanceRequestView()
    }
}
