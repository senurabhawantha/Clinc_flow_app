//
//  ConsultationScreenView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-03-12.
//
//
//  ConsultationScreenView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-03-12.
//

import SwiftUI

struct ConsultationScreenView: View {
    
    @State private var symptomListReady = false
    @State private var medicationsNoted = false
    @State private var idCardReady = false
    @State private var navigateToBookAppointmentTimeView = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color(red: 245/255, green: 246/255, blue: 248/255)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    headerView
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 0) {
                            doctorCard
                                .padding(.top, 20)
                            
                            sectionTitle("LOCATION DETAILS")
                                .padding(.top, 28)
                            
                            locationCard
                                .padding(.top, 14)
                            
                            sectionTitle("PRE-CONSULTATION CHECKLIST")
                                .padding(.top, 34)
                            
                            checklistRow(
                                title: "Have symptoms list ready",
                                isChecked: $symptomListReady
                            )
                            .padding(.top, 16)
                            
                            checklistRow(
                                title: "Note down current medications",
                                isChecked: $medicationsNoted
                            )
                            .padding(.top, 14)
                            
                            checklistRow(
                                title: "ID card or medical insurance",
                                isChecked: $idCardReady
                            )
                            .padding(.top, 14)
                            
                            NavigationLink(
                                destination: BookAppointmentTimeView(),
                                isActive: $navigateToBookAppointmentTimeView
                            ) {
                                EmptyView()
                            }
                            
                            Spacer(minLength: 140)
                        }
                        .padding(.horizontal, 14)
                    }
                }
                
                bottomButtonBar
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var headerView: some View {
        ZStack {
            HStack {
                Button(action: {
                    // back action
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                }
                
                Spacer()
            }
            
            Text("Consultation")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
        }
        .padding(.horizontal, 14)
        .frame(height: 56)
        .padding(.top, 8)
    }
    
    private var doctorCard: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                Image("doctor_consultation")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 223)
                    .frame(maxWidth: .infinity)
                    .clipped()
                
                Text("AVAILABLE")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.horizontal, 14)
                    .frame(height: 22)
                    .background(Color(red: 33/255, green: 221/255, blue: 214/255))
                    .clipShape(Capsule())
                    .padding(.leading, 18)
                    .padding(.bottom, 16)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Dr. Sarah Mitchell")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                    .padding(.top, 24)
                
                Text("General Practitioner • 12 years exp.")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(red: 102/255, green: 119/255, blue: 149/255))
                    .padding(.top, 8)
                
                HStack(spacing: 8) {
                    Image(systemName: "seal.fill")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(Color(red: 33/255, green: 221/255, blue: 214/255))
                    
                    Text("Certified Family Medicine Specialist")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Color(red: 33/255, green: 221/255, blue: 214/255))
                }
                .padding(.top, 18)
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color(red: 220/255, green: 227/255, blue: 235/255), lineWidth: 1)
        )
    }
    
    private func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 13, weight: .bold))
            .tracking(1.6)
            .foregroundColor(Color(red: 107/255, green: 123/255, blue: 150/255))
            .padding(.leading, 4)
    }
    
    private var locationCard: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color(red: 229/255, green: 246/255, blue: 244/255))
                    .frame(width: 46, height: 46)
                
                Image(systemName: "mappin")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(red: 33/255, green: 221/255, blue: 214/255))
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Room 12, Level 2")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                
                Text("Main Building, North Wing")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(red: 102/255, green: 119/255, blue: 149/255))
            }
            
            Spacer()
            
            Image(systemName: "map")
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(Color(red: 33/255, green: 221/255, blue: 214/255))
        }
        .padding(.horizontal, 18)
        .frame(height: 86)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color(red: 220/255, green: 227/255, blue: 235/255), lineWidth: 1)
        )
    }
    
    private func checklistRow(title: String, isChecked: Binding<Bool>) -> some View {
        Button(action: {
            isChecked.wrappedValue.toggle()
        }) {
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(red: 58/255, green: 72/255, blue: 97/255))
                
                Spacer()
                
                ZStack {
                    Circle()
                        .stroke(
                            isChecked.wrappedValue
                            ? Color(red: 33/255, green: 221/255, blue: 214/255)
                            : Color(red: 192/255, green: 203/255, blue: 218/255),
                            lineWidth: 1.4
                        )
                        .frame(width: 30, height: 30)
                    
                    if isChecked.wrappedValue {
                        Circle()
                            .fill(Color(red: 33/255, green: 221/255, blue: 214/255))
                            .frame(width: 18, height: 18)
                    }
                }
            }
            .padding(.horizontal, 20)
            .frame(height: 64)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color(red: 220/255, green: 227/255, blue: 235/255), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
    
    private var bottomButtonBar: some View {
        VStack(spacing: 0) {
            Divider()
                .overlay(Color(red: 225/255, green: 232/255, blue: 238/255))
            
            Button(action: {
                navigateToBookAppointmentTimeView = true
            }) {
                HStack(spacing: 14) {
                    Image(systemName: "person.badge.plus")
                        .font(.system(size: 20, weight: .semibold))
                    
                    Text("Book Check-in")
                        .font(.system(size: 18, weight: .bold))
                }
                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                .frame(maxWidth: .infinity)
                .frame(height: 64)
                .background(Color(red: 33/255, green: 221/255, blue: 214/255))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .padding(.horizontal, 14)
                .padding(.top, 18)
                .padding(.bottom, 18)
            }
            .background(Color(red: 245/255, green: 246/255, blue: 248/255))
        }
    }
}

#Preview {
    ConsultationScreenView()
}
