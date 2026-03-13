//
//  BookAppointmentView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-03-12.
//
import SwiftUI

struct BookAppointmentTimeView: View {
    
    @State private var selectedDateIndex: Int = 1
    @State private var selectedSlot: String = "10:00 AM"
    @State private var navigateToConfirmBookingView = false
    
    private let dates: [(day: String, number: String)] = [
        ("MON", "12"),
        ("TUE", "13"),
        ("WED", "14"),
        ("THU", "15"),
        ("FRI", "16")
    ]
    
    private let morningSlots: [String] = [
        "09:00 AM", "09:30 AM", "10:00 AM",
        "10:30 AM", "11:00 AM", "11:30 AM"
    ]
    
    private let afternoonSlots: [String] = [
        "01:00 PM", "01:30 PM", "02:00 PM",
        "03:00 PM", "04:30 PM", "05:00 PM"
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                let sidePadding: CGFloat = 28
                let availableWidth = geo.size.width - (sidePadding * 2)
                let dateSpacing: CGFloat = 16
                let slotSpacing: CGFloat = 14
                
                let dateCardWidth = (availableWidth - (dateSpacing * 4)) / 5
                let slotWidth = (availableWidth - (slotSpacing * 2)) / 3
                
                ZStack(alignment: .bottom) {
                    Color(
                        red: 245/255,
                        green: 246/255,
                        blue: 248/255
                    )
                    .ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        header
                            .padding(.horizontal, sidePadding)
                            .padding(.top, 10)
                        
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 0) {
                                
                                Text("Pick a Time")
                                    .font(.system(size: 34, weight: .bold))
                                    .foregroundColor(Color(red: 7/255, green: 20/255, blue: 58/255))
                                    .padding(.top, 26)
                                
                                Text("Dr. Sarah Mitchell • General Practice")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color(red: 112/255, green: 128/255, blue: 156/255))
                                    .padding(.top, 8)
                                
                                HStack {
                                    Text("Select Date")
                                        .font(.system(size: 21, weight: .bold))
                                        .foregroundColor(Color(red: 7/255, green: 20/255, blue: 58/255))
                                    
                                    Spacer()
                                    
                                    Text("October 2023")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(Color(red: 31/255, green: 216/255, blue: 211/255))
                                }
                                .padding(.top, 46)
                                
                                HStack(spacing: dateSpacing) {
                                    ForEach(dates.indices, id: \.self) { index in
                                        DateCardView(
                                            day: dates[index].day,
                                            number: dates[index].number,
                                            isSelected: selectedDateIndex == index
                                        )
                                        .frame(width: dateCardWidth, height: 146)
                                        .onTapGesture {
                                            selectedDateIndex = index
                                        }
                                    }
                                }
                                .padding(.top, 22)
                                
                                slotSectionTitle(icon: "sun.max.fill", title: "Morning Slots")
                                    .padding(.top, 46)
                                
                                LazyVGrid(
                                    columns: [
                                        GridItem(.fixed(slotWidth), spacing: slotSpacing),
                                        GridItem(.fixed(slotWidth), spacing: slotSpacing),
                                        GridItem(.fixed(slotWidth), spacing: slotSpacing)
                                    ],
                                    spacing: 16
                                ) {
                                    ForEach(morningSlots, id: \.self) { slot in
                                        TimeSlotView(
                                            title: slot,
                                            isSelected: selectedSlot == slot,
                                            isDisabled: slot == "11:00 AM"
                                        )
                                        .frame(width: slotWidth, height: 74)
                                        .onTapGesture {
                                            if slot != "11:00 AM" {
                                                selectedSlot = slot
                                            }
                                        }
                                    }
                                }
                                .padding(.top, 22)
                                
                                slotSectionTitle(icon: "moon.fill", title: "Afternoon Slots")
                                    .padding(.top, 36)
                                
                                LazyVGrid(
                                    columns: [
                                        GridItem(.fixed(slotWidth), spacing: slotSpacing),
                                        GridItem(.fixed(slotWidth), spacing: slotSpacing),
                                        GridItem(.fixed(slotWidth), spacing: slotSpacing)
                                    ],
                                    spacing: 16
                                ) {
                                    ForEach(afternoonSlots, id: \.self) { slot in
                                        TimeSlotView(
                                            title: slot,
                                            isSelected: selectedSlot == slot,
                                            isDisabled: false
                                        )
                                        .frame(width: slotWidth, height: 74)
                                        .onTapGesture {
                                            selectedSlot = slot
                                        }
                                    }
                                }
                                .padding(.top, 22)
                                
                                NavigationLink(
                                    destination: ConfirmBookingView(),
                                    isActive: $navigateToConfirmBookingView
                                ) {
                                    EmptyView()
                                }
                                
                                .padding(.bottom, 220)
                            }
                            .padding(.horizontal, sidePadding)
                        }
                    }
                    
                    bottomPanel
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var header: some View {
        ZStack {
            HStack {
                Button(action: {}) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(Color(red: 7/255, green: 20/255, blue: 58/255))
                }
                
                Spacer()
            }
            
            Text("Book Appointment")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color(red: 7/255, green: 20/255, blue: 58/255))
        }
        .frame(height: 44)
    }
    
    private func slotSectionTitle(icon: String, title: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(Color(red: 150/255, green: 164/255, blue: 189/255))
            
            Text(title)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color(red: 7/255, green: 20/255, blue: 58/255))
        }
    }
    
    private var bottomPanel: some View {
        VStack(spacing: 0) {
            Divider()
                .overlay(Color(red: 224/255, green: 228/255, blue: 234/255))
            
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("SELECTED SLOT")
                            .font(.system(size: 11, weight: .bold))
                            .tracking(2)
                            .foregroundColor(Color(red: 112/255, green: 128/255, blue: 156/255))
                        
                        Text("Tue, Oct 13 • \(selectedSlot)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color(red: 7/255, green: 20/255, blue: 58/255))
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(Color(red: 31/255, green: 216/255, blue: 211/255))
                            .frame(width: 46, height: 46)
                        
                        Image(systemName: "checkmark")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                
                Button(action: {
                    navigateToConfirmBookingView = true
                }) {
                    Text("Confirm Slot")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(red: 7/255, green: 20/255, blue: 58/255))
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .background(Color(red: 31/255, green: 216/255, blue: 211/255))
                        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                        .shadow(
                            color: Color(red: 31/255, green: 216/255, blue: 211/255).opacity(0.22),
                            radius: 14,
                            x: 0,
                            y: 8
                        )
                }
                .padding(.top, 24)
            }
            .padding(.horizontal, 28)
            .padding(.top, 18)
            .padding(.bottom, 18)
            .background(
                Color(
                    red: 245/255,
                    green: 246/255,
                    blue: 248/255
                )
            )
        }
    }
}

struct DateCardView: View {
    let day: String
    let number: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 18) {
            Text(day)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(
                    isSelected
                    ? Color(red: 7/255, green: 20/255, blue: 58/255)
                    : Color(red: 112/255, green: 128/255, blue: 156/255)
                )
            
            Text(number)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(red: 7/255, green: 20/255, blue: 58/255))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    isSelected
                    ? Color(red: 31/255, green: 216/255, blue: 211/255)
                    : Color(red: 235/255, green: 239/255, blue: 244/255)
                )
        )
    }
}

struct TimeSlotView: View {
    let title: String
    let isSelected: Bool
    let isDisabled: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(borderColor, lineWidth: 1)
                )
            
            if isDisabled {
                Text(title)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(Color.gray.opacity(0.65))
                    .strikethrough(true, color: Color.gray.opacity(0.65))
            } else {
                Text(title)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(Color(red: 7/255, green: 20/255, blue: 58/255))
            }
        }
    }
    
    private var backgroundColor: Color {
        if isDisabled {
            return Color(red: 240/255, green: 242/255, blue: 246/255)
        } else if isSelected {
            return Color(red: 31/255, green: 216/255, blue: 211/255)
        } else {
            return Color(red: 235/255, green: 239/255, blue: 244/255)
        }
    }
    
    private var borderColor: Color {
        if isSelected {
            return Color(red: 196/255, green: 246/255, blue: 243/255)
        } else {
            return Color(red: 220/255, green: 225/255, blue: 232/255)
        }
    }
}

#Preview {
    BookAppointmentTimeView()
}
