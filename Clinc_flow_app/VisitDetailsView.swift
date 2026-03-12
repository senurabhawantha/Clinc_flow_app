//
//  VisitDetailsView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-03-12.
//
import SwiftUI

struct VisitDetailsView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(red: 246/255, green: 248/255, blue: 250/255)
                .ignoresSafeArea()

            VStack(spacing: 0) {

                // HEADER
                ZStack {
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 22, weight: .medium))
                                .foregroundColor(Color(red: 8/255, green: 16/255, blue: 42/255))
                        }
                        Spacer()
                    }

                    Text("Visit Details")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(red: 8/255, green: 16/255, blue: 42/255))
                }
                .padding(.horizontal, 24)
                .frame(height: 56)

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {

                        // TITLE
                        Text("Post-Consultation")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(Color(red: 8/255, green: 16/255, blue: 42/255))
                            .padding(.top, 30)

                        Text("Follow the steps below to complete your visit.")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color(red: 102/255, green: 120/255, blue: 150/255))
                            .padding(.top, 6)

                        // LAB TEST CARD
                        VStack(spacing: 0) {

                            Image("lab_tests")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 230)
                                .clipped()

                            VStack(alignment: .leading, spacing: 0) {

                                HStack(spacing: 8) {
                                    Circle()
                                        .fill(Color(red: 35/255, green: 214/255, blue: 206/255))
                                        .frame(width: 8, height: 8)

                                    Text("Step 1 of 2")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(Color(red: 76/255, green: 96/255, blue: 126/255))
                                }
                                .padding(.top, 18)

                                Text("Lab Tests")
                                    .font(.system(size: 26, weight: .bold))
                                    .foregroundColor(Color(red: 8/255, green: 16/255, blue: 42/255))
                                    .padding(.top, 14)

                                Text("Required: Blood Test (Room 5, G Floor)")
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundColor(Color(red: 102/255, green: 120/255, blue: 150/255))
                                    .padding(.top, 8)

                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "cross.case.fill")
                                            .font(.system(size: 18, weight: .bold))

                                        Text("View Queue")
                                            .font(.system(size: 18, weight: .bold))
                                    }
                                    .foregroundColor(Color(red: 8/255, green: 16/255, blue: 42/255))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .background(Color(red: 35/255, green: 214/255, blue: 206/255))
                                    .cornerRadius(14)
                                }
                                .padding(.top, 20)
                                .padding(.bottom, 26)
                            }
                            .padding(.horizontal, 24)
                            .background(Color.white)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.top, 24)

                        // PHARMACY CARD
                        VStack(spacing: 0) {

                            Image("pharmacy")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()

                            VStack(alignment: .leading, spacing: 0) {

                                Text("Step 2 of 2")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(Color(red: 106/255, green: 122/255, blue: 146/255))
                                    .padding(.top, 18)

                                Text("Pharmacy")
                                    .font(.system(size: 26, weight: .bold))
                                    .foregroundColor(Color(red: 8/255, green: 16/255, blue: 42/255))
                                    .padding(.top, 14)

                                VStack(spacing: 18) {

                                    HStack(spacing: 16) {

                                        Circle()
                                            .fill(Color(red: 191/255, green: 242/255, blue: 238/255))
                                            .frame(width: 50, height: 50)
                                            .overlay(
                                                Image(systemName: "pills.fill")
                                                    .foregroundColor(Color(red: 29/255, green: 215/255, blue: 205/255))
                                            )

                                        VStack(alignment: .leading) {
                                            Text("STATUS")
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(.gray)

                                            Text("Preparing medications")
                                                .font(.system(size: 17, weight: .semibold))
                                        }
                                    }

                                    HStack(spacing: 16) {

                                        Circle()
                                            .fill(Color(red: 191/255, green: 242/255, blue: 238/255))
                                            .frame(width: 50, height: 50)
                                            .overlay(
                                                Image(systemName: "clock.fill")
                                                    .foregroundColor(Color(red: 29/255, green: 215/255, blue: 205/255))
                                            )

                                        VStack(alignment: .leading) {
                                            Text("ESTIMATED TIME")
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(.gray)

                                            Text("Ready in: 10 min")
                                                .font(.system(size: 17, weight: .semibold))
                                        }
                                    }

                                }
                                .padding(.top, 20)
                                .padding(.bottom, 26)
                            }
                            .padding(.horizontal, 24)
                            .background(Color.white)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.top, 24)

                        // HELP TEXT
                        HStack {
                            Text("Need help? Visit the front desk or call ")
                            + Text("Ext. 402")
                                .foregroundColor(Color(red: 29/255, green: 215/255, blue: 205/255))
                        }
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(Color(red: 142/255, green: 156/255, blue: 180/255))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 36)
                        .padding(.bottom, 120)
                    }
                    .padding(.horizontal, 24)
                }
            }

            // BOTTOM NAVIGATION BAR
            HStack {
                tabItem(icon: "house.fill", title: "HOME", selected: false)

                Spacer()

                tabItem(icon: "calendar", title: "VISITS", selected: true)

                Spacer()

                tabItem(icon: "map.fill", title: "MAP", selected: false)

                Spacer()

                tabItem(icon: "person.fill", title: "PROFILE", selected: false)
            }
            .padding(.horizontal, 34)
            .padding(.top, 14)
            .padding(.bottom, 20)
            .background(Color(red: 246/255, green: 248/255, blue: 250/255))
        }
    }

    func tabItem(icon: String, title: String, selected: Bool) -> some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(selected ? Color(red: 29/255, green: 215/255, blue: 205/255) : .gray)

            Text(title)
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(selected ? Color(red: 29/255, green: 215/255, blue: 205/255) : .gray)
        }
    }
}

#Preview {
    VisitDetailsView()
}
