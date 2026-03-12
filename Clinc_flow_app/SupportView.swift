//
//  HelpView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-02-17.
//

import SwiftUI

struct SupportView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    
                    // MARK: - Header & Search
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Help")
                            .font(.system(size: 44, weight: .bold))
                            .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.2)) // Deep navy
                        
                        // Custom Search Bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search for answers...", text: $searchText)
                        }
                        .padding(.vertical, 14)
                        .padding(.horizontal, 16)
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Contact Support Card
                    VStack(spacing: 24) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Still need help?")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("Our clinic staff is ready to assist you.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            // Staff Icon
                            ZStack {
                                Circle()
                                    .fill(Color(red: 0.85, green: 0.98, blue: 0.95))
                                    .frame(width: 50, height: 50)
                                Image(systemName: "person.badge.shield.checkmark.fill")
                                    .foregroundColor(Color(red: 0.11, green: 0.93, blue: 0.84))
                            }
                        }
                        
                        HStack(spacing: 16) {
                            HelpButton(title: "Call Desk", icon: "phone.fill", isPrimary: true)
                            HelpButton(title: "Find Desk", icon: "map.fill", isPrimary: false)
                        }
                    }
                    .padding(24)
                    .background(Color.white)
                    .cornerRadius(24)
                    .shadow(color: .black.opacity(0.03), radius: 15, y: 10)
                    .padding(.horizontal)
                    
                    // MARK: - FAQ Sections
                    VStack(alignment: .leading, spacing: 24) {
                        FAQBlock(title: "GENERAL QUESTIONS", questions: [
                            "Where do I register?",
                            "What are the opening hours?",
                            "Is there free Wi-Fi?"
                        ])
                        
                        FAQBlock(title: "APPOINTMENTS", questions: [
                            "How do I cancel my appointment?",
                            "Can I change my doctor?"
                        ])
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                }
                .padding(.top, 20)
            }
            .background(Color(white: 0.98))
        }
    }
}

// MARK: - Subviews for HelpView

struct HelpButton: View {
    let title: String
    let icon: String
    let isPrimary: Bool
    
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                Text(title)
            }
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .frame(height: 54)
            .background(isPrimary ? Color(red: 0.11, green: 0.93, blue: 0.84) : Color.gray.opacity(0.08))
            .cornerRadius(14)
        }
    }
}

struct FAQBlock: View {
    let title: String
    let questions: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.gray.opacity(0.7))
            
            VStack(spacing: 0) {
                ForEach(questions.indices, id: \.self) { index in
                    DisclosureGroup {
                        Text("To find the registration desk, please proceed to the Main Lobby on Level 1. Look for the 'Registration' sign near the elevators.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } label: {
                        Text(questions[index])
                            .font(.system(size: 17, weight: .medium))
                            .foregroundColor(.black)
                    }
                    .accentColor(.gray) // Changes the chevron color
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)
                    
                    if index != questions.count - 1 {
                        Divider().padding(.horizontal, 20)
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(18)
            .shadow(color: .black.opacity(0.02), radius: 5, y: 2)
        }
    }
}

// MARK: - Preview
#Preview {
    SupportView()
}
