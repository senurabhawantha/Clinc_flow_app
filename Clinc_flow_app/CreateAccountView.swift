//
//  CreateAccountView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-02-21.
//
import SwiftUI

struct CreateAccountView: View {
    // MARK: - State Properties
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var agreeToTerms = false
    @State private var isPasswordVisible = false
    
    @State private var navigateToHome = false
    @State private var navigateToLogin = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color(white: 0.98)
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 0) {
                    // MARK: - Navigation Header
                    Button(action: {
                        navigateToLogin = true
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 30)

                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 32) {
                            
                            // MARK: - Title Section
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Create Account")
                                    .font(.system(size: 34, weight: .bold))
                                    .foregroundColor(Color(red: 0.1, green: 0.15, blue: 0.2))

                                Text("Join Clinic Flow to track your visits in real-time and manage appointments.")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                                    .lineSpacing(4)
                            }

                            // MARK: - Form Fields
                            VStack(spacing: 24) {
                                inputField(
                                    label: "Full Name",
                                    placeholder: "Jane Doe",
                                    icon: "person",
                                    text: $fullName
                                )
                                
                                inputField(
                                    label: "Email",
                                    placeholder: "jane@example.com",
                                    icon: "envelope",
                                    text: $email
                                )
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)

                                passwordField(label: "Password", text: $password)
                                
                                passwordField(
                                    label: "Confirm Password",
                                    text: $confirmPassword,
                                    icon: "arrow.counterclockwise"
                                )
                            }

                            // MARK: - Terms & Conditions
                            HStack(alignment: .top, spacing: 12) {
                                Button(action: {
                                    agreeToTerms.toggle()
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                            .frame(width: 22, height: 22)
                                            .background(
                                                RoundedRectangle(cornerRadius: 4)
                                                    .fill(agreeToTerms ? Color.cyan : Color.white)
                                            )

                                        if agreeToTerms {
                                            Image(systemName: "checkmark")
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(.white)
                                        }
                                    }
                                }

                                (
                                    Text("I agree to the ")
                                    + Text("Terms of Service").bold().underline()
                                    + Text(" and ")
                                    + Text("Privacy Policy").bold().underline()
                                )
                                .font(.system(size: 14))
                                .foregroundColor(Color(red: 0.1, green: 0.15, blue: 0.2))
                            }

                            // MARK: - Create Account Button
                            Button(action: {
                                navigateToHome = true
                            }) {
                                Text("Create Account")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.15))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 18)
                                    .background(Color(red: 0.1, green: 0.95, blue: 0.85))
                                    .cornerRadius(12)
                            }
                            .padding(.top, 10)

                            // MARK: - Footer
                            HStack {
                                Spacer()
                                
                                Text("Already have an account?")
                                    .foregroundColor(.gray)
                                
                                Button(action: {
                                    navigateToLogin = true
                                }) {
                                    Text("Log In")
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                }
                                
                                Spacer()
                            }
                            .font(.system(size: 16))
                            .padding(.bottom, 20)

                            // Hidden navigation links
                            NavigationLink(destination: Home(), isActive: $navigateToHome) {
                                EmptyView()
                            }

                            NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                                EmptyView()
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    // MARK: - Helper UI Components
    
    @ViewBuilder
    private func inputField(label: String, placeholder: String, icon: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.system(size: 16, weight: .bold))
            
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.gray)
                    .frame(width: 20)
                
                TextField(placeholder, text: text)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2))
            )
        }
    }

    @ViewBuilder
    private func passwordField(label: String, text: Binding<String>, icon: String = "lock") -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.system(size: 16, weight: .bold))
            
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.gray)
                    .frame(width: 20)
                
                if isPasswordVisible {
                    TextField("••••••••", text: text)
                } else {
                    SecureField("••••••••", text: text)
                }
                
                if label == "Password" {
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2))
            )
        }
    }
}

#Preview {
    CreateAccountView()
}
