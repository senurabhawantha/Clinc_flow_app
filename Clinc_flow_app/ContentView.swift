//
//  ContentView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-02-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            // MARK: - Logo and Header
            VStack(spacing: 24) {
                // Logo Icon
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.white)
                        .frame(width: 100, height: 100)
                        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                    
                    Image(systemName: "flask.fill") // Replace with custom asset
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(red: 0.11, green: 0.93, blue: 0.84))
                }
                
                VStack(spacing: 12) {
                    Text("Clinic Flow")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("Track your clinic visit and find the\nright place, faster.")
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
            }
            
            Spacer()
            
            // MARK: - Primary Actions
            VStack(spacing: 20) {
                Button(action: {
                    print("Start Visit tapped")
                }) {
                    HStack {
                        Text("Start Visit")
                            .font(.headline)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color(red: 0.11, green: 0.93, blue: 0.84))
                    .cornerRadius(12)
                    .shadow(color: Color(red: 0.11, green: 0.93, blue: 0.84).opacity(0.3), radius: 10, y: 5)
                }
                
                Button("How it works") {
                    // Action
                }
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color(red: 0.11, green: 0.93, blue: 0.84))
            }
            .padding(.horizontal, 24)
            
            // MARK: - Accessibility Section
            VStack(alignment: .leading, spacing: 12) {
                Text("ACCESSIBILITY")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                
                VStack(spacing: 0) {
                    SettingsRow(icon: "textformat.size", title: "Text Size", value: "Default", iconBg: Color(red: 0.9, green: 1.0, blue: 0.98))
                    
                    Divider().padding(.leading, 50)
                    
                    SettingsRow(icon: "globe", title: "Language", value: "English", iconBg: Color(red: 0.9, green: 1.0, blue: 0.98))
                }
                .background(Color.white)
                .cornerRadius(16)
            }
            .padding(.top, 40)
            .padding(.horizontal, 24)
            .padding(.bottom, 20)
        }
        .background(Color(white: 0.98).edgesIgnoringSafeArea(.all))
    }
}

// MARK: - Reusable Row Component
struct SettingsRow: View {
    let icon: String
    let title: String
    let value: String
    let iconBg: Color
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(iconBg)
                    .frame(width: 36, height: 36)
                Image(systemName: icon)
                    .foregroundColor(Color(red: 0.11, green: 0.93, blue: 0.84))
            }
            
            Text(title)
                .font(.system(size: 16, weight: .medium))
            
            Spacer()
            
            Text(value)
                .foregroundColor(.gray)
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.gray.opacity(0.5))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
