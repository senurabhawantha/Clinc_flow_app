//
//  QueueStatusView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-02-17.
//

import SwiftUI

struct QueueStatusView: View {
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Navigation Bar
            HStack {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Queue Status")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
                // Empty view to balance the header
                Color.clear.frame(width: 18, height: 18)
            }
            .padding()

            ScrollView {
                VStack(spacing: 32) {
                    
                    // MARK: - Ticket Card
                    VStack(spacing: 24) {
                        VStack(spacing: 8) {
                            Text("YOUR TICKET")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.gray.opacity(0.6))
                            
                            Text("3A")
                                .font(.system(size: 80, weight: .black))
                        }
                        
                        // Status Badge
                        HStack(spacing: 6) {
                            Circle()
                                .fill(Color(red: 0.11, green: 0.93, blue: 0.84))
                                .frame(width: 8, height: 8)
                            Text("Now serving: **2B**")
                                .font(.system(size: 14))
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.gray.opacity(0.08))
                        .clipShape(Capsule())
                        
                        // Progress Section
                        VStack(spacing: 12) {
                            HStack {
                                Text("Checked In")
                                Spacer()
                                Text("Almost There")
                            }
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.gray.opacity(0.6))
                            
                            GeometryReader { geo in
                                ZStack(alignment: .leading) {
                                    Capsule()
                                        .fill(Color.gray.opacity(0.1))
                                    Capsule()
                                        .fill(Color(red: 0.11, green: 0.93, blue: 0.84))
                                        .frame(width: geo.size.width * 0.75) // Progress at 75%
                                }
                            }
                            .frame(height: 10)
                        }
                        .padding(.horizontal, 8)
                        
                        // Data Grid
                        HStack(spacing: 16) {
                            QueueStatBox(value: "14", label: "People\nAhead")
                            QueueStatBox(value: "25", unit: "m", label: "Est.\nWait Time")
                        }
                    }
                    .padding(32)
                    .background(Color.white)
                    .cornerRadius(32)
                    .shadow(color: Color.black.opacity(0.03), radius: 20, x: 0, y: 10)
                    .padding(.horizontal)
                    
                    // MARK: - Notification Hint
                    HStack(alignment: .top, spacing: 16) {
                        Image(systemName: "bell.badge.fill")
                            .font(.system(size: 24))
                            .foregroundColor(Color(red: 0.11, green: 0.93, blue: 0.84))
                        
                        Text("Relax! We’ll send you a push notification when it’s your turn to see the doctor.")
                            .font(.system(size: 15))
                            .foregroundColor(.gray.opacity(0.8))
                            .lineSpacing(4)
                    }
                    .padding(.horizontal, 30)
                }
                .padding(.vertical)
            }
            
            // MARK: - Bottom Actions
            VStack(spacing: 16) {
                // Clinic Tip Card
                HStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(Color(red: 0.9, green: 1.0, blue: 0.98))
                            .frame(width: 44, height: 44)
                        Image(systemName: "plus.app.fill")
                            .foregroundColor(Color(red: 0.11, green: 0.93, blue: 0.84))
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Clinic Tip")
                            .font(.system(size: 16, weight: .bold))
                        Text("Please have your ID ready for verification.")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .padding(.horizontal)
                
                // Primary Action Button
                Button(action: {}) {
                    HStack(spacing: 12) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 20))
                        Text("I’m Here (Check-in)")
                            .font(.system(size: 18, weight: .bold))
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color(red: 0.11, green: 0.93, blue: 0.84))
                    .cornerRadius(16)
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
            .background(Color(white: 0.98))
        }
        .background(Color(white: 0.98).edgesIgnoringSafeArea(.all))
    }
}

// MARK: - Subviews

struct QueueStatBox: View {
    let value: String
    var unit: String? = nil
    let label: String
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text(value)
                    .font(.system(size: 36, weight: .bold))
                if let unit = unit {
                    Text(unit)
                        .font(.system(size: 18, weight: .bold))
                }
            }
            
            Text(label)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.gray.opacity(0.6))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(Color.gray.opacity(0.04))
        .cornerRadius(20)
    }
}
#Preview {
    QueueStatusView()
}
