//
//  ClinicMapView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-02-17.
//

import SwiftUI
import MapKit

struct ClinicMapView: View {
    @State private var selectedTab = "Map"
    @State private var currentLevel = "L1"
    
    var body: some View {
        ZStack(alignment: .top) {
            // MARK: - Map Layer
            // In a real app, use Map(coordinateRegion: ...)
            Rectangle()
                .fill(Color(white: 0.95))
                .overlay(
                    Text("Indoor Map Visualization Placeholder")
                        .foregroundColor(.gray)
                )
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // MARK: - Header & Picker
                VStack(spacing: 16) {
                    Text("Map")
                        .font(.system(size: 34, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Segmented Picker
                    HStack(spacing: 0) {
                        PickerButton(title: "Map", isSelected: selectedTab == "Map") { selectedTab = "Map" }
                        PickerButton(title: "Directions", isSelected: selectedTab == "Directions") { selectedTab = "Directions" }
                    }
                    .padding(4)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding(.horizontal)
                .background(Color.white.opacity(0.9))
                
                // MARK: - Level Selector & Map Tools
                HStack(alignment: .top) {
                    // Floor Levels
                    VStack(spacing: 0) {
                        LevelButton(text: "L2", isSelected: currentLevel == "L2") { currentLevel = "L2" }
                        Divider()
                        LevelButton(text: "L1", isSelected: currentLevel == "L1") { currentLevel = "L1" }
                        Divider()
                        LevelButton(text: "G", isSelected: currentLevel == "G") { currentLevel = "G" }
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 10)
                    
                    Spacer()
                    
                    // Map Action Buttons
                    VStack(spacing: 12) {
                        MapActionButton(icon: "layers.3d.fill")
                        MapActionButton(icon: "location.fill")
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // MARK: - Destination Detail Card
                DestinationCard()
            }
            
            // MARK: - Custom Bottom Tab Bar
            VStack {
                Spacer()
                MapTabBar()
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

// MARK: - Subviews

struct DestinationCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Drag Indicator
            Capsule()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 40, height: 6)
                .frame(maxWidth: .infinity)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Registration Counter 3A")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Main Hall, Level 1")
                        .foregroundColor(.gray)
                }
                Spacer()
                // Walking Icon
                ZStack {
                    Circle().fill(Color(red: 0.9, green: 1.0, blue: 0.98))
                    Image(systemName: "figure.walk")
                        .foregroundColor(Color(red: 0.11, green: 0.93, blue: 0.84))
                }
                .frame(width: 44, height: 44)
            }
            
            HStack(spacing: 12) {
                InfoBadge(icon: "clock", text: "3 min")
                InfoBadge(icon: "ruler", text: "120m")
            }
            
            Button(action: {}) {
                Label("Start Directions", systemImage: "location.north.fill")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color(red: 0.11, green: 0.93, blue: 0.84))
                    .cornerRadius(16)
            }
        }
        .padding(24)
        .background(Color.white)
        .clipShape(RoundedCorner(radius: 32, corners: [.topLeft, .topRight]))
        .shadow(color: .black.opacity(0.1), radius: 20, y: -10)
    }
}

struct InfoBadge: View {
    let icon: String
    let text: String
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 14))
            Text(text)
                .font(.system(size: 14, weight: .bold))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color.gray.opacity(0.05))
        .cornerRadius(8)
    }
}

struct MapActionButton: View {
    let icon: String
    var body: some View {
        Button(action: {}) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.black.opacity(0.7))
                .frame(width: 44, height: 44)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.1), radius: 10)
        }
    }
}

struct LevelButton: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(isSelected ? .black : .gray)
                .frame(width: 44, height: 44)
                .background(isSelected ? Color(red: 0.11, green: 0.93, blue: 0.84) : Color.white)
        }
    }
}

struct PickerButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 15, weight: .semibold))
                .frame(maxWidth: .infinity)
                .frame(height: 36)
                .background(isSelected ? Color.white : Color.clear)
                .foregroundColor(isSelected ? .black : .gray)
                .cornerRadius(8)
                .shadow(color: isSelected ? .black.opacity(0.1) : .clear, radius: 4)
        }
    }
}

// MARK: - Tab Bar
struct MapTabBar: View {
    var body: some View {
        HStack {
            TabItem(icon: "house", label: "Home", isSelected: false)
            TabItem(icon: "list.bullet", label: "Queue", isSelected: false)
            TabItem(icon: "map.fill", label: "Map", isSelected: true)
            TabItem(icon: "person", label: "Profile", isSelected: false)
        }
        .padding(.top, 12)
        .padding(.bottom, 34)
        .background(Color.white)
        .shadow(color: .black.opacity(0.05), radius: 10, y: -5)
    }
}

// Helpers
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    ClinicMapView()
}
