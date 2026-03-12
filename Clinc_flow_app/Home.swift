
//  Home.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-03-12.
//

import SwiftUI

struct Home: View {
    
    @State private var navigateToVisitSetupView = false
    @State private var navigateToMapScreenView = false
    @State private var navigateToBookAppointmentView = false
    @State private var navigateToClinicUpdatesView = false
    
    @State private var navigateToMyVisitDashboardView = false
    @State private var navigateToProfileView = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 24) {
                            
                            // MARK: - Header
                            HStack(alignment: .top) {
                                HStack(spacing: 14) {
                                    ZStack {
                                        Circle()
                                            .fill(Color(red: 0.95, green: 0.78, blue: 0.67))
                                            .frame(width: 56, height: 56)
                                        
                                        Image(systemName: "doc.text.fill")
                                            .font(.system(size: 22))
                                            .foregroundColor(.white)
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Good morning,")
                                            .font(.system(size: 17, weight: .medium))
                                            .foregroundColor(Color.gray)
                                        
                                        Text("Kevin Perera")
                                            .font(.system(size: 28, weight: .bold))
                                            .foregroundColor(Color(red: 0.12, green: 0.15, blue: 0.24))
                                    }
                                }
                                
                                Spacer()
                                
                                ZStack(alignment: .topTrailing) {
                                    Image(systemName: "bell")
                                        .font(.system(size: 24, weight: .medium))
                                        .foregroundColor(Color(red: 0.12, green: 0.15, blue: 0.24))
                                    
                                    Circle()
                                        .fill(Color(red: 0.14, green: 0.86, blue: 0.82))
                                        .frame(width: 12, height: 12)
                                        .offset(x: 5, y: -4)
                                }
                                .padding(.top, 8)
                            }
                            .padding(.top, 12)
                            
                            // MARK: - Quick Actions
                            Text("QUICK ACTIONS")
                                .font(.system(size: 15, weight: .bold))
                                .tracking(2)
                                .foregroundColor(Color(red: 0.43, green: 0.50, blue: 0.63))
                            
                            VStack(spacing: 16) {
                                HStack(spacing: 16) {
                                    Button(action: {
                                        navigateToVisitSetupView = true
                                    }) {
                                        QuickActionCard(
                                            icon: "calendar",
                                            title: "Check-in",
                                            subtitle: "Schedule an\nappointment"
                                        )
                                    }
                                    .buttonStyle(.plain)
                                    
                                    Button(action: {
                                        navigateToMapScreenView = true
                                    }) {
                                        QuickActionCard(
                                            icon: "map",
                                            title: "Find Clinic",
                                            subtitle: "Locate nearest center"
                                        )
                                    }
                                    .buttonStyle(.plain)
                                }
                                
                                HStack(spacing: 16) {
                                    Button(action: {
                                        navigateToBookAppointmentView = true
                                    }) {
                                        QuickActionCard(
                                            icon: "video.fill",
                                            title: "Telehealth",
                                            subtitle: "Consult via video call"
                                        )
                                    }
                                    .buttonStyle(.plain)
                                    
                                    Button(action: {
                                        navigateToClinicUpdatesView = true
                                    }) {
                                        QuickActionCard(
                                            icon: "doc.text",
                                            title: "Updates",
                                            subtitle: "View health history"
                                        )
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            
                            // MARK: - Upcoming Appointment
                            Text("UPCOMING APPOINTMENT")
                                .font(.system(size: 15, weight: .bold))
                                .tracking(2)
                                .foregroundColor(Color(red: 0.43, green: 0.50, blue: 0.63))
                                .padding(.top, 8)
                            
                            AppointmentCard()
                            
                            // MARK: - Health Updates
                            Text("HEALTH UPDATES")
                                .font(.system(size: 15, weight: .bold))
                                .tracking(2)
                                .foregroundColor(Color(red: 0.43, green: 0.50, blue: 0.63))
                                .padding(.top, 8)
                            
                            VStack(spacing: 14) {
                                HealthUpdateRow(
                                    icon: "flask",
                                    iconBg: Color(red: 0.91, green: 0.94, blue: 1.0),
                                    iconColor: Color.blue,
                                    title: "Your lab results are ready",
                                    subtitle: "Routine blood panel • 2 hours ago"
                                )
                                
                                HealthUpdateRow(
                                    icon: "heart",
                                    iconBg: Color(red: 1.0, green: 0.93, blue: 0.93),
                                    iconColor: Color.red,
                                    title: "Tips for a healthy heart",
                                    subtitle: "Health blog • Yesterday"
                                )
                            }
                            
                            Spacer(minLength: 100)
                            
                            // Hidden Navigation Links
                            NavigationLink(destination: VisitSetUpView(), isActive: $navigateToVisitSetupView) {
                                EmptyView()
                            }
                            
                            NavigationLink(destination: MapScreenView(), isActive: $navigateToMapScreenView) {
                                EmptyView()
                            }
                            
                            NavigationLink(destination: BookAppointmentView(), isActive: $navigateToBookAppointmentView) {
                                EmptyView()
                            }
                            
                            NavigationLink(destination: ClinicUpdatesView(), isActive: $navigateToClinicUpdatesView) {
                                EmptyView()
                            }
                            
                            NavigationLink(destination: MyVisitDashboardView(), isActive: $navigateToMyVisitDashboardView) {
                                EmptyView()
                            }
                            
                            NavigationLink(destination: ProfileView(), isActive: $navigateToProfileView) {
                                EmptyView()
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 18)
                    }
                    
                    BottomTabBar(
                        onVisitsTap: {
                            navigateToMyVisitDashboardView = true
                        },
                        onMapTap: {
                            navigateToMapScreenView = true
                        },
                        onProfileTap: {
                            navigateToProfileView = true
                        }
                    )
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

// MARK: - Quick Action Card
struct QuickActionCard: View {
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(red: 0.89, green: 0.97, blue: 0.97))
                    .frame(width: 52, height: 52)
                
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(Color(red: 0.12, green: 0.86, blue: 0.82))
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(red: 0.12, green: 0.15, blue: 0.24))
                
                Text(subtitle)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(red: 0.45, green: 0.50, blue: 0.60))
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
        }
        .padding(20)
        .frame(maxWidth: .infinity, minHeight: 170, maxHeight: 170, alignment: .topLeading)
        .background(Color.white)
        .cornerRadius(18)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color(red: 0.86, green: 0.89, blue: 0.93), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.03), radius: 6, x: 0, y: 2)
    }
}

// MARK: - Appointment Card
struct AppointmentCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(alignment: .top, spacing: 14) {
                ZStack {
                    Circle()
                        .fill(Color(red: 0.25, green: 0.50, blue: 0.50))
                        .frame(width: 72, height: 72)
                    
                    Image(systemName: "stethoscope")
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Dr. Sarah Mitchell")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(red: 0.12, green: 0.15, blue: 0.24))
                    
                    Text("General Practice")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(Color(red: 0.45, green: 0.50, blue: 0.60))
                }
                
                Spacer()
                
                Text("CONFIRMED")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(Color(red: 0.12, green: 0.86, blue: 0.82))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 7)
                    .background(Color(red: 0.88, green: 0.98, blue: 0.95))
                    .cornerRadius(16)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 10) {
                    Image(systemName: "calendar")
                        .foregroundColor(Color(red: 0.12, green: 0.86, blue: 0.82))
                    
                    Text("Tomorrow, 10:00 AM")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(red: 0.12, green: 0.15, blue: 0.24))
                }
                
                HStack(spacing: 10) {
                    Image(systemName: "location")
                        .foregroundColor(Color(red: 0.12, green: 0.86, blue: 0.82))
                    
                    Text("City Medical Center")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(red: 0.12, green: 0.15, blue: 0.24))
                }
            }
            .padding(.leading, 94)
            
            Button(action: {}) {
                Text("View Details")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(red: 0.02, green: 0.10, blue: 0.20))
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color(red: 0.13, green: 0.84, blue: 0.82))
                    .cornerRadius(12)
            }
            .padding(.top, 4)
            .padding(.horizontal, 8)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 0.86, green: 0.89, blue: 0.93), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.03), radius: 6, x: 0, y: 2)
    }
}

// MARK: - Health Update Row
struct HealthUpdateRow: View {
    let icon: String
    let iconBg: Color
    let iconColor: Color
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(iconBg)
                    .frame(width: 54, height: 54)
                
                Image(systemName: icon)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(iconColor)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(Color(red: 0.12, green: 0.15, blue: 0.24))
                
                Text(subtitle)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(red: 0.45, green: 0.50, blue: 0.60))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color(red: 0.78, green: 0.81, blue: 0.86))
        }
        .padding(18)
        .background(Color.white)
        .cornerRadius(18)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color(red: 0.86, green: 0.89, blue: 0.93), lineWidth: 1)
        )
    }
}

// MARK: - Bottom Tab Bar
struct BottomTabBar: View {
    var onVisitsTap: () -> Void
    var onMapTap: () -> Void
    var onProfileTap: () -> Void
    
    var body: some View {
        HStack {
            TabBarItem(icon: "house", title: "Home", isSelected: true) {
                // Already on Home
            }
            
            Spacer()
            
            TabBarItem(icon: "calendar", title: "Visits", isSelected: false) {
                onVisitsTap()
            }
            
            Spacer()
            
            TabBarItem(icon: "map", title: "Map", isSelected: false) {
                onMapTap()
            }
            
            Spacer()
            
            TabBarItem(icon: "person", title: "Profile", isSelected: false) {
                onProfileTap()
            }
        }
        .padding(.horizontal, 28)
        .padding(.top, 14)
        .padding(.bottom, 22)
        .background(Color.white)
        .overlay(
            Rectangle()
                .fill(Color(red: 0.90, green: 0.92, blue: 0.95))
                .frame(height: 1),
            alignment: .top
        )
    }
}

struct TabBarItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(
                        isSelected
                        ? Color(red: 0.12, green: 0.86, blue: 0.82)
                        : Color(red: 0.62, green: 0.67, blue: 0.76)
                    )
                
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(
                        isSelected
                        ? Color(red: 0.12, green: 0.86, blue: 0.82)
                        : Color(red: 0.62, green: 0.67, blue: 0.76)
                    )
            }
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Preview
#Preview {
    Home()
}
