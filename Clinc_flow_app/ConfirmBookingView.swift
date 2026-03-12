import SwiftUI

struct ConfirmBookingView: View {
    @State private var reasonForVisit: String = ""

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(hex: "#F3F4F6")
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    headerView
                    titleView
                    appointmentCard
                    reasonSection
                    feeSection

                    // Extra spacing so bottom button doesn't cover content
                    Spacer()
                        .frame(height: 130)
                }
                .padding(.horizontal, 24)
                .padding(.top, 12)
                .padding(.bottom, 20)
            }

            bottomBar
        }
    }
}

// MARK: - Header
extension ConfirmBookingView {
    private var headerView: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(Color(hex: "#0A1330"))
            }

            Spacer()

            Text("Book Appointment")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color(hex: "#0A1330"))

            Spacer()

            // keeps title centered
            Color.clear
                .frame(width: 24, height: 24)
        }
    }

    private var titleView: some View {
        Text("Confirm Booking")
            .font(.system(size: 34, weight: .bold))
            .foregroundColor(Color(hex: "#0A1330"))
            .padding(.top, 10)
    }
}

// MARK: - Appointment Card
extension ConfirmBookingView {
    private var appointmentCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            imageSection
            detailsSection
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color(hex: "#D9DEE7"), lineWidth: 1)
        )
    }

    private var imageSection: some View {
        ZStack(alignment: .bottomLeading) {
            // Replace with your asset image
            Image("clinic_image")
                .resizable()
                .scaledToFill()
                .frame(height: 280)
                .frame(maxWidth: .infinity)
                .clipped()

            Text("IN-PERSON")
                .font(.system(size: 14, weight: .bold))
                .tracking(1)
                .foregroundColor(Color(hex: "#07142D"))
                .padding(.horizontal, 18)
                .padding(.vertical, 10)
                .background(Color(hex: "#22D8D0"))
                .clipShape(Capsule())
                .padding(.leading, 18)
                .padding(.bottom, 18)
        }
        .frame(height: 280)
    }

    private var detailsSection: some View {
        VStack(alignment: .leading, spacing: 18) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Service")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color(hex: "#70819B"))

                Text("General Consultation")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color(hex: "#0A1330"))
            }

            doctorSection

            Divider()
                .background(Color(hex: "#DDE3EB"))

            dateTimeSection

            Divider()
                .background(Color(hex: "#DDE3EB"))

            locationSection
        }
        .padding(20)
    }

    private var doctorSection: some View {
        HStack(spacing: 14) {
            Image("doctor_image")
                .resizable()
                .scaledToFill()
                .frame(width: 52, height: 52)
                .clipShape(Circle())
                .background(Circle().fill(Color.gray.opacity(0.15)))

            VStack(alignment: .leading, spacing: 2) {
                Text("Doctor")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color(hex: "#70819B"))

                Text("Dr. Sarah Mitchell")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(hex: "#0A1330"))
            }

            Spacer()
        }
    }

    private var dateTimeSection: some View {
        HStack(alignment: .top, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Image(systemName: "calendar")
                        .foregroundColor(Color(hex: "#22D8D0"))
                    Text("DATE")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color(hex: "#22D8D0"))
                        .tracking(0.8)
                }

                Text("Mon, Oct 24")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(hex: "#0A1330"))
            }

            Spacer()

            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Image(systemName: "clock")
                        .foregroundColor(Color(hex: "#22D8D0"))
                    Text("TIME")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color(hex: "#22D8D0"))
                        .tracking(0.8)
                }

                Text("10:00 AM")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(hex: "#0A1330"))
            }

            Spacer()
        }
    }

    private var locationSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundColor(Color(hex: "#22D8D0"))
                Text("LOCATION")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(hex: "#22D8D0"))
                    .tracking(0.8)
            }

            Text("City Medical Center, Floor 3")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color(hex: "#0A1330"))

            Text("123 Wellness Blvd, Medical District")
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(Color(hex: "#70819B"))
        }
    }
}

// MARK: - Reason Section
extension ConfirmBookingView {
    private var reasonSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Reason for visit")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color(hex: "#0A1330"))

            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .stroke(Color(hex: "#D9DEE7"), lineWidth: 1)
                    )
                    .frame(height: 150)

                TextEditor(text: $reasonForVisit)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color(hex: "#0A1330"))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 12)
                    .frame(height: 150)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)

                if reasonForVisit.isEmpty {
                    Text("Briefly describe your symptoms or reason\nfor the appointment... (optional)")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color(hex: "#98A5B9"))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .allowsHitTesting(false)
                }
            }
        }
    }
}

// MARK: - Fee
extension ConfirmBookingView {
    private var feeSection: some View {
        HStack {
            Text("Consultation Fee")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(Color(hex: "#70819B"))

            Spacer()

            Text("$85.00")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color(hex: "#0A1330"))
        }
        .padding(.top, 4)
    }
}

// MARK: - Bottom Bar
extension ConfirmBookingView {
    private var bottomBar: some View {
        VStack(spacing: 0) {
            Divider()
                .background(Color(hex: "#DDE3EB"))

            Button(action: {
                print("Book Now tapped")
            }) {
                HStack(spacing: 10) {
                    Spacer()

                    Text("Book Now")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color(hex: "#07142D"))

                    Image(systemName: "arrow.right")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(Color(hex: "#07142D"))

                    Spacer()
                }
                .frame(height: 72)
                .background(Color(hex: "#22D8D0"))
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .padding(.bottom, 20)
            }
            .background(Color(hex: "#F3F4F6"))
        }
        .background(Color(hex: "#F3F4F6").ignoresSafeArea(edges: .bottom))
    }
}

// MARK: - Hex Color Helper
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (
                255,
                (int >> 8) * 17,
                (int >> 4 & 0xF) * 17,
                (int & 0xF) * 17
            )
        case 6:
            (a, r, g, b) = (
                255,
                int >> 16,
                int >> 8 & 0xFF,
                int & 0xFF
            )
        case 8:
            (a, r, g, b) = (
                int >> 24,
                int >> 16 & 0xFF,
                int >> 8 & 0xFF,
                int & 0xFF
            )
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Preview
#Preview {
    ConfirmBookingView()
}
