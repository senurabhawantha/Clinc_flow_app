//
//  Category.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-03-12.
//
import SwiftUI

struct Category: View {
    var body: some View {
        GeometryReader { geo in
            let horizontalPadding: CGFloat = 16
            let cardHeight: CGFloat = 92
            let bannerHeight: CGFloat = min(210, geo.size.height * 0.26)
            
            ZStack {
                Color(red: 0.96, green: 0.97, blue: 0.98)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 18) {
                        
                        // MARK: - Header
                        ZStack {
                            Text("Select Service")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(red: 0.09, green: 0.13, blue: 0.22))
                            
                            HStack {
                                Button(action: {}) {
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 22, weight: .semibold))
                                        .foregroundColor(Color(red: 0.09, green: 0.13, blue: 0.22))
                                        .frame(width: 36, height: 36)
                                }
                                
                                Spacer()
                            }
                        }
                        .padding(.top, 6)
                        
                        // MARK: - Search Bar
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(Color(red: 0.60, green: 0.66, blue: 0.76))
                            
                            Text("Search clinic services")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color(red: 0.45, green: 0.52, blue: 0.64))
                            
                            Spacer()
                        }
                        .padding(.horizontal, 14)
                        .frame(height: 54)
                        .background(Color(red: 0.92, green: 0.94, blue: 0.97))
                        .cornerRadius(14)
                        
                        // MARK: - Categories Title
                        HStack(alignment: .center) {
                            Text("Categories")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(red: 0.09, green: 0.13, blue: 0.22))
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Text("View all")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(Color(red: 0.11, green: 0.84, blue: 0.82))
                            }
                        }
                        .padding(.top, 4)
                        
                        // MARK: - Category List
                        VStack(spacing: 14) {
                            CategoryRow(
                                icon: "stethoscope",
                                title: "General OPD",
                                subtitle: "Routine checkups",
                                height: cardHeight
                            )
                            
                            CategoryRow(
                                icon: "cross.case.fill",
                                title: "Laboratory",
                                subtitle: "Blood tests & diagnostics",
                                height: cardHeight
                            )
                            
                            CategoryRow(
                                icon: "cross.case",
                                title: "Radiology",
                                subtitle: "X-ray, MRI & Imaging",
                                height: cardHeight
                            )
                            
                            CategoryRow(
                                icon: "capsule",
                                title: "Pharmacy",
                                subtitle: "Prescriptions & health supplies",
                                height: cardHeight
                            )
                            
                            CategoryRow(
                                icon: "cross.case.fill",
                                title: "Specialist",
                                subtitle: "Expert medical consultants",
                                height: cardHeight
                            )
                        }
                        
                        // MARK: - Banner
                        WellnessBanner(height: bannerHeight)
                            .padding(.top, 6)
                    }
                    .padding(.horizontal, horizontalPadding)
                    .padding(.top, 10)
                    .padding(.bottom, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

// MARK: - Category Row
struct CategoryRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let height: CGFloat
    
    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(red: 0.89, green: 0.97, blue: 0.97))
                    .frame(width: 60, height: 60)
                
                Image(systemName: icon)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(Color(red: 0.11, green: 0.84, blue: 0.82))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(Color(red: 0.09, green: 0.13, blue: 0.22))
                
                Text(subtitle)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(red: 0.45, green: 0.52, blue: 0.64))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer(minLength: 8)
            
            Image(systemName: "chevron.right")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color(red: 0.77, green: 0.81, blue: 0.87))
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .frame(height: height)
        .background(Color.white)
        .cornerRadius(18)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color(red: 0.89, green: 0.92, blue: 0.95), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.025), radius: 5, x: 0, y: 2)
    }
}

// MARK: - Wellness Banner
struct WellnessBanner: View {
    let height: CGFloat
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("wellness_banner")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .clipped()
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0.32),
                    Color.black.opacity(0.06)
                ]),
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
            
            VStack(alignment: .leading, spacing: 6) {
                Text("WELLNESS PLAN")
                    .font(.system(size: 12, weight: .bold))
                    .tracking(1.2)
                    .foregroundColor(.white.opacity(0.95))
                
                Text("Book a full body screening\ntoday")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                    .lineLimit(2)
            }
            .padding(.horizontal, 18)
            .padding(.bottom, 18)
        }
        .frame(maxWidth: .infinity)
        .frame(height: height)
        .background(Color.gray.opacity(0.18))
        .cornerRadius(20)
        .clipped()
    }
}

#Preview {
    Category()
}
