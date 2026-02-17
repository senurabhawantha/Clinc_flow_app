//
//  MyVisitView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-02-17.
//


import SwiftUI

struct MyVisitView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: - Header
                    HStack {
                        Text("My Visit")
                            .font(.system(size: 34, weight: .bold))
                        Spacer()
                        Image(systemName: "bell")
                            .font(.system(size: 22))
                            .overlay(
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 8, height: 8)
                                    .offset(x: 8, y: -8),
                                alignment: .topTrailing
                            )
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // MARK: - Live Status Card
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Circle().fill(Color.cyan).frame(width: 10, height: 10)
                            Text("LIVE STATUS")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.cyan)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Currently in")
                                .foregroundColor(.gray)
                                .font(.headline)
                            Text("Registration Queue")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                        HStack(alignment: .firstTextBaseline, spacing: 8) {
                            Text("18–25")
                                .font(.system(size: 48, weight: .bold))
                            Text("min wait")
                                .font(.title3)
                                .foregroundColor(.gray)
                        }
                        
                        HStack(spacing: 12) {
                            // View Queue Button
                            Button(action: {}) {
                                HStack {
                                    Image(systemName: "list.bullet.indent")
                                    Text("View\nQueue")
                                        .multilineTextAlignment(.leading)
                                }
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, minHeight: 80)
                                .background(Color.cyan.opacity(0.8))
                                .cornerRadius(16)
                            }
                            
                            // View Map Button
                            Button(action: {}) {
                                HStack {
                                    Image(systemName: "map")
                                    Text("View Map")
                                }
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, minHeight: 80)
                                .background(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                            }
                        }
                    }
                    .padding(24)
                    .background(Color.white)
                    .cornerRadius(24)
                    .shadow(color: Color.black.opacity(0.05), radius: 15, x: 0, y: 10)
                    .padding(.horizontal)
                    
                    // MARK: - Up Next
                    VStack(alignment: .leading, spacing: 12) {
                        Label("UP NEXT", systemImage: "arrow.right")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.gray)
                        
                        HStack(spacing: 16) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.cyan.opacity(0.1))
                                    .frame(width: 50, height: 50)
                                Image(systemName: "cross.case.fill")
                                    .foregroundColor(.cyan)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Consultation")
                                    .font(.headline)
                                Label("Room 12, Level 2", systemImage: "mappin.and.ellipse")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray.opacity(0.5))
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(16)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Timeline Section
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Today's updates")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        TimelineItem(time: "09:15 AM", text: "Documents verified successfully.", isCurrent: true)
                        TimelineItem(time: "09:00 AM", text: "Checked in at Main Lobby kiosk.", isCurrent: false, isLast: true)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 100) // Space for Tab Bar
                }
            }
            .background(Color(white: 0.98))
            
            // MARK: - Custom Tab Bar
            CustomTabBar()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

// MARK: - Supporting Components

struct TimelineItem: View {
    let time: String
    let text: String
    let isCurrent: Bool
    var isLast: Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(spacing: 0) {
                Circle()
                    .strokeBorder(isCurrent ? Color.cyan : Color.gray.opacity(0.3), lineWidth: 2)
                    .frame(width: 14, height: 14)
                if !isLast {
                    Rectangle()
                        .fill(Color.gray.opacity(0.1))
                        .frame(width: 2)
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(time)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(text)
                    .font(.body)
                    .foregroundColor(.black.opacity(0.8))
            }
            .padding(.bottom, 24)
        }
    }
}

struct CustomTabBar: View {
    var body: some View {
        HStack {
            TabItem(icon: "house.fill", label: "Home", isSelected: false)
            TabItem(icon: "list.bullet.below.rectangle", label: "My Visit", isSelected: true)
            TabItem(icon: "clock.arrow.circlepath", label: "History", isSelected: false)
            TabItem(icon: "person.fill", label: "Profile", isSelected: false)
        }
        .padding(.top, 12)
        .padding(.bottom, 34)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.05), radius: 10, y: -5)
    }
}

struct TabItem: View {
    let icon: String
    let label: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
            Text(label)
                .font(.caption2)
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(isSelected ? .cyan : .gray)
    }
}


#Preview {
    MyVisitView()
}
