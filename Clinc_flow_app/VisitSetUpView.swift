//
//  SetUpVisitView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-02-17.
//

import SwiftUI

struct VisitSetUpView: View {
    @State private var visitCode: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Navigation Header
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(red: 0.2, green: 0.3, blue: 0.4))
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    
                    // MARK: - Title
                    Text("Set up\nyour visit")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.2))
                        .lineSpacing(0)
                        .padding(.horizontal)
                    
                    // MARK: - Visit Code Card
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Visit Code")
                            .font(.headline)
                            .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.2))
                        
                        HStack {
                            Image(systemName: "number")
                                .foregroundColor(.gray)
                            TextField("e.g., CL-48291", text: $visitCode)
                                .font(.system(size: 18, weight: .medium))
                        }
                        .padding()
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(16)
                        
                        Text("Enter the unique 6-digit code received in your confirmation SMS or email.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .lineSpacing(4)
                        
                        Button(action: {
                            print("Continue with: \(visitCode)")
                        }) {
                            HStack {
                                Text("Continue")
                                Image(systemName: "arrow.right")
                            }
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color(red: 0.11, green: 0.93, blue: 0.84))
                            .cornerRadius(16)
                            .shadow(color: Color(red: 0.11, green: 0.93, blue: 0.84).opacity(0.3), radius: 10, y: 5)
                        }
                    }
                    .padding(24)
                    .background(Color.white)
                    .cornerRadius(24)
                    .shadow(color: .black.opacity(0.02), radius: 20, y: 10)
                    .padding(.horizontal)
                    
                    // MARK: - Divider
                    HStack {
                        Rectangle().fill(Color.gray.opacity(0.2)).frame(height: 1)
                        Text("OR").font(.caption).bold().foregroundColor(.gray).padding(.horizontal)
                        Rectangle().fill(Color.gray.opacity(0.2)).frame(height: 1)
                    }
                    .padding(.horizontal, 40)
                    
                    // MARK: - QR Code Card
                    VStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(Color(red: 0.85, green: 0.98, blue: 0.95))
                                .frame(width: 56, height: 56)
                            Image(systemName: "qrcode.viewfinder")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.11, green: 0.93, blue: 0.84))
                        }
                        
                        VStack(spacing: 8) {
                            Text("Scan QR Code")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("Use your camera to scan the\ncode at the reception kiosk.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        
                        Button(action: {}) {
                            Label("Open Camera", systemImage: "camera.fill")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(Color.gray.opacity(0.08))
                                .cornerRadius(16)
                        }
                    }
                    .padding(24)
                    .background(Color.white)
                    .cornerRadius(24)
                    .shadow(color: .black.opacity(0.02), radius: 20, y: 10)
                    .padding(.horizontal)
                    
                    // MARK: - Footer
                    VStack(spacing: 12) {
                        Label("Secure & Private", systemImage: "lock.fill")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color(red: 0.5, green: 0.6, blue: 0.7))
                        
                        Group {
                            Text("Your health data is processed securely according to our ") +
                            Text("Privacy Policy").foregroundColor(.brandTeal).underline() +
                            Text(" and ") +
                            Text("Terms of Service").foregroundColor(.brandTeal).underline() +
                            Text(".")
                        }
                        .font(.caption)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                    }
                    .padding(.bottom, 40)
                }
            }
        }
        .background(Color(white: 0.98).edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }
}

// MARK: - Color Extension
extension Color {
    static let brandTeal = Color(red: 0.11, green: 0.75, blue: 0.70)
}

#Preview {
    VisitSetUpView()
}
