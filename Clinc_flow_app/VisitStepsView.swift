//
//  VisitStepsView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-02-17.
//

import SwiftUI

struct VisitStepsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Navigation Header
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(red: 0.11, green: 0.75, blue: 0.70))
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Visit Steps")
                        .font(.system(size: 34, weight: .bold))
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                    
                    // MARK: - Timeline
                    ZStack(alignment: .topLeading) {
                        // The continuous vertical line
                        Rectangle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(width: 2)
                            .offset(x: 24)
                            .padding(.vertical, 10)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            
                            // 1. ACTIVE STEP: Registration
                            ActiveStepCard()
                            
                            // 2. UPCOMING STEPS
                            UpcomingStepRow(number: "2", title: "Triage Assessment", time: "Est. 15m")
                            UpcomingStepRow(number: "3", title: "Doctor Consultation", time: "Est. 20m")
                            UpcomingStepRow(number: "4", title: "Lab Tests", time: "If needed")
                            UpcomingStepRow(number: "5", title: "Pharmacy", time: "Pickup")
                            
                            // 6. FINAL STEP
                            UpcomingStepRow(number: nil, title: "Visit Complete", time: "", isLast: true)
                        }
                    }
                }
                .padding(.bottom, 30)
            }
            
            // MARK: - Bottom Help Hint
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 44, height: 44)
                    Image(systemName: "person.badge.key.fill") // Representative icon
                        .foregroundColor(Color(red: 0.11, green: 0.93, blue: 0.84))
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Need help finding your way?")
                        .font(.system(size: 15, weight: .bold))
                    Text("Ask a nurse or use the map.")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .background(Color(red: 0.93, green: 0.98, blue: 0.98))
            .cornerRadius(16)
            .padding()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

// MARK: - Subviews

struct ActiveStepCard: View {
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // Active Node
            Circle()
                .fill(Color(red: 0.11, green: 0.93, blue: 0.84))
                .frame(width: 44, height: 44)
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4)
                )
                .zIndex(1)
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Registration")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    Text("IN PROGRESS")
                        .font(.system(size: 12, weight: .bold))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color(red: 0.9, green: 1.0, blue: 0.98))
                        .foregroundColor(Color(red: 0.11, green: 0.75, blue: 0.70))
                        .cornerRadius(8)
                }
                
                // Detailed Info Card
                VStack(alignment: .leading, spacing: 12) {
                    Label("What to do now", systemImage: "info.circle.fill")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("Please approach Counter 3")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.2))
                    
                    VStack(alignment: .leading, spacing: 8) {
                        StepBullet(text: "Prepare your ID Card or Passport")
                        StepBullet(text: "Have your insurance number ready")
                    }
                    
                    HStack(spacing: 12) {
                        SmallActionBtn(title: "View Queue", icon: "person.2.fill")
                        SmallActionBtn(title: "View Map", icon: "map.fill", isSecondary: true)
                    }
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.04), radius: 15, x: 0, y: 10)
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 24)
    }
}

struct UpcomingStepRow: View {
    let number: String?
    let title: String
    let time: String
    var isLast: Bool = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            // Step Node
            ZStack {
                Circle()
                    .fill(isLast ? Color(red: 0.9, green: 1.0, blue: 0.98) : Color.white)
                    .frame(width: 44, height: 44)
                    .overlay(Circle().stroke(Color.gray.opacity(0.1), lineWidth: 1))
                
                if let num = number {
                    Text(num)
                        .font(.headline)
                        .foregroundColor(.gray)
                } else {
                    Image(systemName: "flag.fill")
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 0.11, green: 0.75, blue: 0.70))
                }
            }
            .zIndex(1)
            
            Text(title)
                .font(.headline)
                .foregroundColor(isLast ? Color(red: 0.1, green: 0.2, blue: 0.3) : .gray)
            
            Spacer()
            
            Text(time)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray.opacity(0.6))
        }
        .padding(.horizontal)
        .padding(.vertical, 16)
    }
}

struct StepBullet: View {
    let text: String
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Circle()
                .fill(Color(red: 0.11, green: 0.93, blue: 0.84))
                .frame(width: 6, height: 6)
                .padding(.top, 6)
            Text(text)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct SmallActionBtn: View {
    let title: String
    let icon: String
    var isSecondary: Bool = false
    
    var body: some View {
        Button(action: {}) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 18))
                Text(title)
                    .font(.system(size: 13, weight: .bold))
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(isSecondary ? Color(red: 0.9, green: 1.0, blue: 0.98) : Color(red: 0.11, green: 0.93, blue: 0.84))
            .cornerRadius(12)
        }
    }
}

// MARK: - Preview
#Preview {
    VisitStepsView()
}
