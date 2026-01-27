//
//  TicketSubmissionView.swift
//  ConquestSolutionsApp
//
//  Created for Conquest Solutions
//  Future Feature: Submit a ticket
//

import SwiftUI

struct TicketSubmissionView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "ticket.fill")
                .font(.system(size: 60))
                .foregroundColor(.green)
            
            Text("Submit a Ticket")
                .font(.title)
                .fontWeight(.bold)
            
            Text("This feature is coming soon!")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("You'll be able to submit technical support tickets directly from the app.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .padding()
        .navigationTitle("Submit Ticket")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        TicketSubmissionView()
    }
}
