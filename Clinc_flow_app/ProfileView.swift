//
//  ProfileView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-03-12.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(red: 245/255, green: 246/255, blue: 248/255)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        headerView
                            .padding(.top, 18)
                        
                        profileSection
                            .padding(.top, 28)
                        
                        settingsSection
                            .padding(.top, 44)
                        
                        helpSection
                            .padding(.top, 36)
                        
                        logoutButton
                            .padding(.top, 40)
                            .padding(.bottom, 120)
                    }
                    .padding(.horizontal, 20)
                }
            }
            
            bottomTabBar
        }
    }
    
    private var headerView: some View {
        ZStack {
            HStack {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "gearshape")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(Color(red: 28/255, green: 221/255, blue: 211/255))
                }
            }
            
            Text("Profile")
                .font(.system(size: 21, weight: .bold))
                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
        }
        .frame(height: 44)
    }
    
    private var profileSection: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomTrailing) {
                Image("profile_avatar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 118, height: 118)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white.opacity(0.9), lineWidth: 5)
                    )
                
                Button(action: {}) {
                    ZStack {
                        Circle()
                            .fill(Color(red: 28/255, green: 221/255, blue: 211/255))
                            .frame(width: 34, height: 34)
                        
                        Image(systemName: "pencil")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                .offset(x: -2, y: -2)
            }
            .frame(maxWidth: .infinity)
            
            Text("Kevin Perera")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                .frame(maxWidth: .infinity)
                .padding(.top, 22)
            
            Text("Member ID: #CF-99201")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Color(red: 102/255, green: 119/255, blue: 149/255))
                .frame(maxWidth: .infinity)
                .padding(.top, 8)
            
            Text("Premium Member")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(Color(red: 28/255, green: 221/255, blue: 211/255))
                .padding(.horizontal, 16)
                .frame(height: 30)
                .background(Color(red: 231/255, green: 246/255, blue: 243/255))
                .clipShape(Capsule())
                .frame(maxWidth: .infinity)
                .padding(.top, 18)
        }
    }
    
    private var settingsSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            sectionTitle("ACCOUNT SETTINGS")
            
            SettingsCardView(items: [
                SettingsRowData(icon: "person", title: "Personal Info", iconTint: Color(red: 28/255, green: 221/255, blue: 211/255), iconBackground: Color(red: 230/255, green: 246/255, blue: 243/255)),
                SettingsRowData(icon: "doc.text", title: "Health Records", iconTint: Color(red: 28/255, green: 221/255, blue: 211/255), iconBackground: Color(red: 230/255, green: 246/255, blue: 243/255)),
                SettingsRowData(icon: "shield", title: "Insurance", iconTint: Color(red: 28/255, green: 221/255, blue: 211/255), iconBackground: Color(red: 230/255, green: 246/255, blue: 243/255))
            ])
            .padding(.top, 14)
        }
    }
    
    private var helpSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            sectionTitle("HELP & SUPPORT")
            
            SettingsCardView(items: [
                SettingsRowData(icon: "questionmark.square", title: "FAQ", iconTint: Color(red: 96/255, green: 108/255, blue: 128/255), iconBackground: Color(red: 236/255, green: 240/255, blue: 245/255)),
                SettingsRowData(icon: "phone.arrow.up.right", title: "Call Help Desk", iconTint: Color(red: 96/255, green: 108/255, blue: 128/255), iconBackground: Color(red: 236/255, green: 240/255, blue: 245/255)),
                SettingsRowData(icon: "message", title: "Message Support", iconTint: Color(red: 96/255, green: 108/255, blue: 128/255), iconBackground: Color(red: 236/255, green: 240/255, blue: 245/255))
            ])
            .padding(.top, 14)
        }
    }
    
    private func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 13, weight: .bold))
            .tracking(1.6)
            .foregroundColor(Color(red: 145/255, green: 158/255, blue: 181/255))
            .padding(.leading, 8)
    }
    
    private var logoutButton: some View {
        Button(action: {}) {
            HStack(spacing: 10) {
                Image(systemName: "arrow.right.square")
                    .font(.system(size: 22, weight: .semibold))
                
                Text("Logout")
                    .font(.system(size: 18, weight: .bold))
            }
            .foregroundColor(Color(red: 255/255, green: 73/255, blue: 100/255))
            .frame(maxWidth: .infinity)
            .frame(height: 68)
            .background(Color(red: 237/255, green: 241/255, blue: 246/255))
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
    }
    
    private var bottomTabBar: some View {
        VStack(spacing: 0) {
            Divider()
                .overlay(Color(red: 228/255, green: 233/255, blue: 239/255))
            
            HStack {
                tabItem(icon: "house", title: "Home", isSelected: false)
                Spacer()
                tabItem(icon: "calendar", title: "Visits", isSelected: false)
                Spacer()
                tabItem(icon: "map", title: "Map", isSelected: false)
                Spacer()
                tabItem(icon: "person.fill", title: "Profile", isSelected: true)
            }
            .padding(.horizontal, 30)
            .padding(.top, 14)
            .padding(.bottom, 14)
            .background(Color(red: 245/255, green: 246/255, blue: 248/255))
        }
    }
    
    private func tabItem(icon: String, title: String, isSelected: Bool) -> some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 23, weight: .medium))
                .foregroundColor(
                    isSelected
                    ? Color(red: 28/255, green: 221/255, blue: 211/255)
                    : Color(red: 145/255, green: 158/255, blue: 181/255)
                )
            
            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(
                    isSelected
                    ? Color(red: 28/255, green: 221/255, blue: 211/255)
                    : Color(red: 145/255, green: 158/255, blue: 181/255)
                )
        }
    }
}

struct SettingsRowData {
    let icon: String
    let title: String
    let iconTint: Color
    let iconBackground: Color
}

struct SettingsCardView: View {
    let items: [SettingsRowData]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                HStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .fill(item.iconBackground)
                            .frame(width: 48, height: 48)
                        
                        Image(systemName: item.icon)
                            .font(.system(size: 22, weight: .medium))
                            .foregroundColor(item.iconTint)
                    }
                    
                    Text(item.title)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Color(red: 192/255, green: 201/255, blue: 214/255))
                }
                .padding(.horizontal, 18)
                .frame(height: 88)
                
                if index < items.count - 1 {
                    Divider()
                        .overlay(Color(red: 232/255, green: 236/255, blue: 242/255))
                        .padding(.leading, 78)
                }
            }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(Color(red: 229/255, green: 234/255, blue: 240/255), lineWidth: 1)
        )
    }
}

#Preview {
    ProfileView()
}
