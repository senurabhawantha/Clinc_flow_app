//
//  UpdatesView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-02-17.
//

import SwiftUI

struct UpdatesView: View {
    let categories = ["All", "Queue", "Directions", "Reminders"]
    @State private var selectedCategory = "All"
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Navigation Bar
            HStack {
                Button(action: {}) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.11, green: 0.75, blue: 0.70))
                }
                
                Spacer()
                
                Button("Clear") { }
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.11, green: 0.75, blue: 0.70))
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Updates")
                        .font(.system(size: 34, weight: .bold))
                        .padding(.horizontal)
                    
                    // MARK: - Category Chips
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(categories, id: \.self) { category in
                                CategoryChip(title: category, isSelected: category == selectedCategory)
                                    .onTapGesture { selectedCategory = category }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // MARK: - Notification List
                    VStack(spacing: 16) {
                        // Urgent/Now Card
                        NotificationCard(
                            icon: "bell.fill",
                            title: "Next in Registration",
                            subtitle: "It's your turn. Please proceed immediately to **Desk 3**.",
                            time: "Now",
                            hasSideBorder: true,
                            isUrgent: true
                        )
                        
                        // Map/Direction Card
                        DirectionNotificationCard()
                        
                        // Standard Check-in Card
                        NotificationCard(
                            icon: "checkmark.circle",
                            title: "Check-in Complete",
                            subtitle: "Your insurance details have been successfully verified.",
                            time: "45m ago"
                        )
                        
                        // Appointment Card
                        NotificationCard(
                            icon: "calendar",
                            title: "Appointment Confirmed",
                            subtitle: "You are set for Dr. Smith at 10:30 AM today.",
                            time: "2h ago"
                        )
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
        }
        .background(Color(white: 0.98))
    }
}

// MARK: - UI Components

struct CategoryChip: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .font(.system(size: 16, weight: .medium))
            .padding(.horizontal, 24)
            .padding(.vertical, 10)
            .background(isSelected ? Color(red: 0.11, green: 0.93, blue: 0.84) : Color.gray.opacity(0.1))
            .foregroundColor(isSelected ? .black : .gray)
            .clipShape(Capsule())
    }
}

struct NotificationCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let time: String
    var hasSideBorder: Bool = false
    var isUrgent: Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // Side Accent Border
            if hasSideBorder {
                Rectangle()
                    .fill(Color(red: 0.11, green: 0.93, blue: 0.84))
                    .frame(width: 4)
                    .cornerRadius(2)
                    .padding(.vertical, 12)
            }
            
            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(red: 0.9, green: 1.0, blue: 0.98))
                    .frame(width: 48, height: 48)
                Image(systemName: icon)
                    .foregroundColor(Color(red: 0.11, green: 0.75, blue: 0.70))
                
                if isUrgent {
                    Circle()
                        .fill(Color(red: 0.11, green: 0.93, blue: 0.84))
                        .frame(width: 10, height: 10)
                        .offset(x: 18, y: -18)
                }
            }
            .padding(.leading, hasSideBorder ? 0 : 16)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .font(.headline)
                    Spacer()
                    Text(time)
                        .font(.subheadline)
                        .foregroundColor(isUrgent ? Color(red: 0.11, green: 0.75, blue: 0.70) : .gray)
                }
                
                Text(LocalizedStringKey(subtitle))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            .padding(.trailing, 16)
        }
        .padding(.vertical, 16)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.03), radius: 5, x: 0, y: 2)
    }
}

struct DirectionNotificationCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top, spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.05))
                        .frame(width: 48, height: 48)
                    Image(systemName: "location.north.fill")
                        .foregroundColor(.black.opacity(0.7))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Head to Radiology")
                            .font(.headline)
                        Spacer()
                        Text("15m ago")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Text("Follow the blue line on the floor to Room 204.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            // Map Preview Placeholder
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.08))
                    .frame(height: 120)
                
                // Simplified Map Path
                Path { path in
                    path.move(to: CGPoint(x: 50, y: 100))
                    path.addQuadCurve(to: CGPoint(x: 250, y: 40), control: CGPoint(x: 150, y: 120))
                }
                .stroke(Color.slateGray, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                
                Text("View Map")
                    .font(.system(size: 14, weight: .bold))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .shadow(radius: 2)
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(20)
    }
}

extension Color {
    static let slateGray = Color(red: 0.2, green: 0.3, blue: 0.35)
}

#Preview {
    UpdatesView()
}
