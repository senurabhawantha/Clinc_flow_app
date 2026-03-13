//
//  PaymentView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-03-12.
//

import SwiftUI

struct PaymentView: View {
    
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 245/255, green: 246/255, blue: 248/255)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    headerView
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Final Step")
                                .font(.system(size: 34, weight: .bold))
                                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                                .padding(.top, 26)
                            
                            paymentCard
                                .padding(.top, 26)
                            
                            Text("Services")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                                .padding(.top, 48)
                            
                            Divider()
                                .overlay(Color(red: 232/255, green: 236/255, blue: 242/255))
                                .padding(.top, 22)
                            
                            serviceRow(
                                icon: "cross.case",
                                title: "Consultation",
                                amount: "$30.00"
                            )
                            .padding(.top, 22)
                            
                            Divider()
                                .overlay(Color(red: 232/255, green: 236/255, blue: 242/255))
                                .padding(.top, 22)
                            
                            serviceRow(
                                icon: "testtube.2",
                                title: "Lab Test",
                                amount: "$15.00"
                            )
                            .padding(.top, 22)
                            
                            NavigationLink(destination: Home(), isActive: $navigateToHome) {
                                EmptyView()
                            }
                            
                            Spacer(minLength: 180)
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    bottomSection
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var headerView: some View {
        ZStack {
            HStack {
                Button(action: {}) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                }
                
                Spacer()
            }
            
            Text("Payment")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
        }
        .padding(.horizontal, 16)
        .frame(height: 56)
        .padding(.top, 6)
    }
    
    private var paymentCard: some View {
        VStack(spacing: 0) {
            Image("payment_hallway")
                .resizable()
                .scaledToFill()
                .frame(height: 170)
                .frame(maxWidth: .infinity)
                .clipped()
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Total Amount: $45.00")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                    .padding(.top, 22)
                
                HStack {
                    Text("Invoice #CF-9921")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(Color(red: 26/255, green: 221/255, blue: 211/255))
                    
                    Spacer()
                    
                    Text("PENDING")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color(red: 26/255, green: 221/255, blue: 211/255))
                        .padding(.horizontal, 16)
                        .frame(height: 32)
                        .background(Color(red: 228/255, green: 245/255, blue: 243/255))
                        .clipShape(Capsule())
                }
                .padding(.top, 12)
                .padding(.bottom, 22)
            }
            .padding(.horizontal, 20)
            .background(Color.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color(red: 225/255, green: 231/255, blue: 238/255), lineWidth: 1)
        )
    }
    
    private func serviceRow(icon: String, title: String, amount: String) -> some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color(red: 226/255, green: 245/255, blue: 242/255))
                    .frame(width: 52, height: 52)
                
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(Color(red: 26/255, green: 221/255, blue: 211/255))
            }
            
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
            
            Spacer()
            
            Text(amount)
                .font(.system(size: 19, weight: .bold))
                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
        }
    }
    
    private var bottomSection: some View {
        VStack(spacing: 0) {
            Button(action: {
                navigateToHome = true
            }) {
                HStack(spacing: 10) {
                    Text("iOS")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Pay with Apple Pay")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 72)
                .background(Color(red: 8/255, green: 22/255, blue: 58/255))
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                .shadow(color: Color.black.opacity(0.12), radius: 12, x: 0, y: 6)
            }
            .padding(.horizontal, 26)
            .padding(.top, 12)
            
            Text("Your transaction is secure and encrypted with\nSSL technology.")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(red: 150/255, green: 162/255, blue: 182/255))
                .multilineTextAlignment(.center)
                .padding(.top, 22)
                .padding(.bottom, 20)
        }
        .background(Color(red: 245/255, green: 246/255, blue: 248/255))
    }
}

#Preview {
    PaymentView()
}
