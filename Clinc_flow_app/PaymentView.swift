//
//  PaymentView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-03-12.
//

import SwiftUI

struct PaymentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.96, green: 0.97, blue: 0.98)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {
                topBar

                Text("Final Step")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(Color(red: 0.03, green: 0.07, blue: 0.18))
                    .padding(.top, 28)
                    .padding(.horizontal, 24)

                paymentCard
                    .padding(.top, 28)
                    .padding(.horizontal, 24)

                Text("Services")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color(red: 0.03, green: 0.07, blue: 0.18))
                    .padding(.top, 36)
                    .padding(.horizontal, 24)

                Divider()
                    .background(Color.gray.opacity(0.25))
                    .padding(.top, 28)
                    .padding(.horizontal, 24)

                serviceRow(
                    icon: "cross.case.fill",
                    title: "Consultation",
                    price: "$30.00"
                )
                .padding(.top, 28)
                .padding(.horizontal, 24)

                Divider()
                    .background(Color.gray.opacity(0.20))
                    .padding(.top, 22)
                    .padding(.horizontal, 24)

                serviceRow(
                    icon: "testtube.2",
                    title: "Lab Test",
                    price: "$15.00"
                )
                .padding(.top, 22)
                .padding(.horizontal, 24)

                Spacer()

                applePayButton
                    .padding(.horizontal, 24)

                Text("Your transaction is secure and encrypted with\nSSL technology.")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(red: 0.58, green: 0.64, blue: 0.74))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 22)

                HStack {
                    Spacer()
                    Text("Flow Demo Only")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color.gray.opacity(0.35))
                        .padding(.trailing, 28)
                        .padding(.top, 8)
                }

                Spacer().frame(height: 18)
            }
        }
    }

    private var topBar: some View {
        ZStack {
            HStack {
                Button(action: {
                    // Back action
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(Color(red: 0.03, green: 0.07, blue: 0.18))
                }

                Spacer()
            }

            Text("Payment")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(red: 0.03, green: 0.07, blue: 0.18))
        }
        .padding(.horizontal, 24)
        .padding(.top, 18)
    }

    private var paymentCard: some View {
        VStack(spacing: 0) {
            // Replace "clinic_room" with your asset image name
            Image("clinic_room")
                .resizable()
                .scaledToFill()
                .frame(height: 240)
                .frame(maxWidth: .infinity)
                .clipped()

            VStack(alignment: .leading, spacing: 14) {
                Text("Total Amount: $45.00")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(red: 0.03, green: 0.07, blue: 0.18))

                HStack {
                    Text("Invoice #CF-9921")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(red: 0.10, green: 0.86, blue: 0.83))

                    Spacer()

                    Text("PENDING")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Color(red: 0.10, green: 0.86, blue: 0.83))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(Color(red: 0.10, green: 0.86, blue: 0.83).opacity(0.12))
                        )
                }
            }
            .padding(20)
            .background(Color.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(Color.black.opacity(0.04), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 4)
    }

    private func serviceRow(icon: String, title: String, price: String) -> some View {
        HStack(spacing: 18) {
            ZStack {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color(red: 0.10, green: 0.86, blue: 0.83).opacity(0.12))
                    .frame(width: 72, height: 72)

                Image(systemName: icon)
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundColor(Color(red: 0.10, green: 0.86, blue: 0.83))
            }

            Text(title)
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(Color(red: 0.03, green: 0.07, blue: 0.18))

            Spacer()

            Text(price)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color(red: 0.03, green: 0.07, blue: 0.18))
        }
    }

    private var applePayButton: some View {
        Button(action: {
            // Apple Pay action
        }) {
            HStack(spacing: 10) {
                Text("")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)

                Text("Pay with Apple Pay")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 78)
            .background(Color(red: 0.02, green: 0.07, blue: 0.20))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 6)
        }
    }
}

#Preview {
    PaymentView()
}
