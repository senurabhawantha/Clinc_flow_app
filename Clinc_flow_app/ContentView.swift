//
//  ContentView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-02-15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var navigateToLogin = false
    
    var body: some View {
        NavigationStack {
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
                        
                        Image(systemName: "flask.fill")
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
                            .font(.system(size: 18, weight: .medium))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.42, green: 0.49, blue: 0.63))
                            .lineSpacing(6)
                    }
                }
                
                Spacer()
                
                // MARK: - Primary Actions
                VStack(spacing: 20) {
                    
                    Button(action: {
                        navigateToLogin = true
                    }) {
                        HStack(spacing: 8) {
                            Text("Start Visit")
                                .font(.system(size: 18, weight: .bold))
                            
                            Image(systemName: "arrow.right")
                                .font(.system(size: 18, weight: .semibold))
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 62)
                        .background(Color(red: 0.11, green: 0.93, blue: 0.84))
                        .cornerRadius(16)
                        .shadow(
                            color: Color(red: 0.11, green: 0.93, blue: 0.84).opacity(0.25),
                            radius: 12,
                            y: 6
                        )
                    }
                    
                    Button("How it works") {
                        // Action
                    }
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(red: 0.11, green: 0.93, blue: 0.84))
                }
                .padding(.horizontal, 26)
                .padding(.bottom, 34)
                
                // MARK: - Accessibility Section
                VStack(alignment: .leading, spacing: 14) {
                    Text("ACCESSIBILITY")
                        .font(.system(size: 14, weight: .bold))
                        .tracking(1.5)
                        .foregroundColor(Color(red: 0.58, green: 0.64, blue: 0.75))
                    
                    VStack(spacing: 0) {
                        AccessibilityRow(
                            icon: "textformat.size",
                            title: "Text Size",
                            value: "Default"
                        )
                        
                        Divider()
                            .padding(.leading, 68)
                        
                        AccessibilityRow(
                            icon: "globe",
                            title: "Language",
                            value: "English"
                        )
                    }
                    .background(Color.white)
                    .cornerRadius(18)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color(red: 0.88, green: 0.90, blue: 0.94), lineWidth: 1)
                    )
                }
                .padding(.horizontal, 26)
                .padding(.bottom, 32)
                
                // Navigation
                NavigationLink(
                    destination: LoginView(),
                    isActive: $navigateToLogin
                ) {
                    EmptyView()
                }
            }
            .background(
                Color(white: 0.98)
                    .ignoresSafeArea()
            )
        }
    }
}

struct AccessibilityRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        Button(action: {
            // Add action here
        }) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 0.90, green: 0.97, blue: 0.96))
                        .frame(width: 36, height: 36)
                    
                    Image(systemName: icon)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(Color(red: 0.11, green: 0.93, blue: 0.84))
                }
                
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Color(red: 0.09, green: 0.13, blue: 0.22))
                
                Spacer()
                
                HStack(spacing: 6) {
                    Text(value)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color(red: 0.58, green: 0.64, blue: 0.75))
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(red: 0.75, green: 0.79, blue: 0.86))
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 72)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ContentView()
}
