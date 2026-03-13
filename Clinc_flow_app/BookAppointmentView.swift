//
//  BookAppointmentView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-03-12.
//
//
//  BookAppointmentView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-03-12.
//

import SwiftUI

struct BookAppointmentView: View {
    
    @State private var navigateToConsultationScreen = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                let screenWidth = geo.size.width
                let horizontalPadding: CGFloat = 16
                let contentWidth = screenWidth - (horizontalPadding * 2)

                ZStack {
                    Color(red: 245/255, green: 246/255, blue: 248/255)
                        .ignoresSafeArea()

                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 0) {
                            topBar
                                .padding(.top, 14)

                            Text("Book Appointment")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                                .padding(.top, 22)

                            searchBar
                                .padding(.top, 22)

                            categoriesHeader
                                .padding(.top, 30)

                            categoriesSection(contentWidth: contentWidth)
                                .padding(.top, 18)

                            doctorsHeader
                                .padding(.top, 40)

                            VStack(spacing: 16) {
                                doctorCard(
                                    imageName: "doctor_1",
                                    name: "Dr. Aris Thorne",
                                    subtitle: "Cardiologist • 8 yrs exp",
                                    price: "$45 / consultation",
                                    rating: "4.9",
                                    imageBg: Color(red: 78/255, green: 156/255, blue: 167/255),
                                    action: {}
                                )

                                doctorCard(
                                    imageName: "doctor_consultation",
                                    name: "Dr. Sarah Mitchell",
                                    subtitle: "General Practitioner • 5 yrs exp",
                                    price: "$30 / consultation",
                                    rating: "4.8",
                                    imageBg: Color(red: 63/255, green: 165/255, blue: 179/255),
                                    action: {
                                        navigateToConsultationScreen = true
                                    }
                                )

                                doctorCard(
                                    imageName: "doctor_3",
                                    name: "Dr. Elena Rodriguez",
                                    subtitle: "Pediatrician • 12 yrs exp",
                                    price: "$50 / consultation",
                                    rating: "5.0",
                                    imageBg: Color(red: 202/255, green: 112/255, blue: 95/255),
                                    action: {}
                                )
                            }
                            .padding(.top, 18)
                            .padding(.bottom, 30)

                            NavigationLink(
                                destination: ConsultationScreenView(),
                                isActive: $navigateToConsultationScreen
                            ) {
                                EmptyView()
                            }
                        }
                        .padding(.horizontal, horizontalPadding)
                        .frame(width: screenWidth, alignment: .leading)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    private var topBar: some View {
        HStack {
            circularButton(icon: "arrow.left")

            Spacer()

            circularButton(icon: "ellipsis")
        }
    }

    private func circularButton(icon: String) -> some View {
        Button(action: {}) {
            ZStack {
                Circle()
                    .fill(Color(red: 236/255, green: 239/255, blue: 244/255))
                    .frame(width: 44, height: 44)

                Image(systemName: icon)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
            }
        }
        .buttonStyle(.plain)
    }

    private var searchBar: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 22, weight: .regular))
                .foregroundColor(Color(red: 148/255, green: 161/255, blue: 183/255))

            Text("Search services or doctors")
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(Color(red: 112/255, green: 128/255, blue: 156/255))

            Spacer()
        }
        .padding(.horizontal, 14)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(Color(red: 235/255, green: 239/255, blue: 245/255))
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
    }

    private var categoriesHeader: some View {
        HStack {
            Text("Categories")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))

            Spacer()

            Text("View All")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color(red: 28/255, green: 221/255, blue: 211/255))
        }
    }

    private func categoriesSection(contentWidth: CGFloat) -> some View {
        let spacing: CGFloat = 16
        let visibleCardWidth = (contentWidth - spacing) / 2
        let cardHeight: CGFloat = 168

        return ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: spacing) {
                categoryCard(
                    title: "General",
                    subtitle: "Common health",
                    icon: "cross.case",
                    bg: Color(red: 185/255, green: 239/255, blue: 234/255),
                    iconColor: Color(red: 27/255, green: 221/255, blue: 211/255),
                    width: visibleCardWidth,
                    height: cardHeight
                )

                categoryCard(
                    title: "Specialist",
                    subtitle: "Expert advice",
                    icon: "stethoscope",
                    bg: Color(red: 198/255, green: 216/255, blue: 245/255),
                    iconColor: Color(red: 72/255, green: 121/255, blue: 237/255),
                    width: visibleCardWidth,
                    height: cardHeight
                )

                categoryCard(
                    title: "Dental",
                    subtitle: "Teeth care",
                    icon: "heart.text.square",
                    bg: Color(red: 237/255, green: 214/255, blue: 247/255),
                    iconColor: Color(red: 180/255, green: 92/255, blue: 220/255),
                    width: visibleCardWidth,
                    height: cardHeight
                )
            }
            .padding(.trailing, 6)
        }
    }

    private func categoryCard(
        title: String,
        subtitle: String,
        icon: String,
        bg: Color,
        iconColor: Color,
        width: CGFloat,
        height: CGFloat
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(bg)
                    .frame(width: width, height: height)

                Image(systemName: icon)
                    .font(.system(size: 36, weight: .medium))
                    .foregroundColor(iconColor)
            }

            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))

            Text(subtitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(red: 102/255, green: 119/255, blue: 149/255))
        }
        .frame(width: width, alignment: .leading)
    }

    private var doctorsHeader: some View {
        HStack {
            Text("Recommended Doctors")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))

            Spacer()

            Image(systemName: "slider.horizontal.3")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(Color(red: 150/255, green: 162/255, blue: 182/255))
        }
    }

    private func doctorCard(
        imageName: String,
        name: String,
        subtitle: String,
        price: String,
        rating: String,
        imageBg: Color,
        action: @escaping () -> Void
    ) -> some View {
        HStack(alignment: .center, spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(imageBg)
                    .frame(width: 72, height: 72)

                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 68, height: 68)
            }

            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top, spacing: 8) {
                    Text(name)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(Color(red: 10/255, green: 20/255, blue: 45/255))
                        .lineLimit(1)
                        .minimumScaleFactor(0.85)

                    Spacer(minLength: 4)

                    HStack(spacing: 4) {
                        Image(systemName: "star")
                            .font(.system(size: 11, weight: .bold))

                        Text(rating)
                            .font(.system(size: 14, weight: .bold))
                    }
                    .foregroundColor(Color(red: 28/255, green: 221/255, blue: 211/255))
                    .padding(.horizontal, 10)
                    .frame(height: 28)
                    .background(Color(red: 232/255, green: 246/255, blue: 244/255))
                    .clipShape(Capsule())
                }

                Text(subtitle)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(red: 102/255, green: 119/255, blue: 149/255))
                    .padding(.top, 4)

                HStack {
                    Text(price)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color(red: 146/255, green: 159/255, blue: 181/255))

                    Spacer()

                    Button(action: action) {
                        Text("Book")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.black)
                            .frame(width: 82, height: 40)
                            .background(Color(red: 28/255, green: 221/255, blue: 211/255))
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                    .buttonStyle(.plain)
                }
                .padding(.top, 12)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(Color(red: 228/255, green: 233/255, blue: 240/255), lineWidth: 1)
        )
    }
}

#Preview {
    BookAppointmentView()
}
