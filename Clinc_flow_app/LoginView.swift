//
//  LoginView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-02-21.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false

    var body: some View {
        ZStack {
            // Background
            Color(white: 0.98).ignoresSafeArea()

            VStack(spacing: 40) { // Increased spacing between major sections
                Spacer().frame(height: 20)

                // MARK: - Header
                VStack(spacing: 12) {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color(red: 0.2, green: 0.9, blue: 0.8))
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.cyan.opacity(0.1)))
                    
                    Text("Clinic Flow").font(.headline).foregroundColor(.secondary)
                    Text("Welcome Back").font(.system(size: 34, weight: .bold))
                    Text("Please enter your details to sign in.").foregroundColor(.gray)
                }

                // MARK: - Input Fields (Email & Password)
                VStack(spacing: 30) { // Increased space between Email and Password blocks
                    
                    // Email Block
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Email Address").font(.system(size: 16, weight: .bold))
                        HStack {
                            Image(systemName: "envelope").foregroundColor(.gray)
                            TextField("Enter your email", text: $email)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.2)))
                    }

                    // Password Block
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Password").font(.system(size: 16, weight: .bold))
                            Spacer()
                            Button("Forgot Password?") {}.font(.caption).foregroundColor(.gray)
                        }
                        HStack {
                            Image(systemName: "lock").foregroundColor(.gray)
                            SecureField("••••••••", text: $password)
                            Image(systemName: "eye.slash").foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.2)))
                    }
                }
                .padding(.horizontal, 24)

                // MARK: - Log In Button
                VStack {
                    Button(action: {}) {
                        Text("Log In")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(Color(red: 0.1, green: 0.95, blue: 0.85))
                            .cornerRadius(15)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 20) // Extra padding to push the button away from the fields

                Spacer()

                // Footer
                HStack {
                    Text("Don't have an account?").foregroundColor(.gray)
                    Text("Sign Up").fontWeight(.bold)
                }
                .padding(.bottom, 10)
            }
        }
    }
}
#Preview {
    LoginView()
}
