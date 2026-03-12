//
//  MapScreenView.swift
//  Clinc_flow_app
//
//  Created by ITEDP on 2026-03-12.
//

import SwiftUI

struct MapScreenView: View {
    @State private var selectedTab: TopTab = .map
    @State private var selectedLevel: String = "L1"

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.systemGray6)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                headerSection
                tabSwitcher
                mapSection
            }
            .ignoresSafeArea(edges: .bottom)

            bottomSheet
        }
    }
}

// MARK: - Header
extension MapScreenView {
    private var headerSection: some View {
        HStack {
            Text("Map")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(Color(.label))
            Spacer()
        }
        .padding(.horizontal, 22)
        .padding(.top, 18)
        .padding(.bottom, 18)
    }

    private var tabSwitcher: some View {
        HStack(spacing: 0) {
            topTabButton(title: "Map", isSelected: selectedTab == .map) {
                selectedTab = .map
            }

            topTabButton(title: "Directions", isSelected: selectedTab == .directions) {
                selectedTab = .directions
            }
        }
        .padding(4)
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .padding(.horizontal, 20)
        .padding(.bottom, 18)
    }

    private func topTabButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(isSelected ? Color(.label) : Color(.systemGray))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(
                    Group {
                        if isSelected {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color.white)
                                .shadow(color: .black.opacity(0.04), radius: 4, x: 0, y: 2)
                        }
                    }
                )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Map Area
extension MapScreenView {
    private var mapSection: some View {
        ZStack {
            Color(.systemGray6)

            mapBackground

            HStack {
                levelSelector
                Spacer()
                rightMapButtons
            }
            .padding(.horizontal, 12)
            .padding(.top, 24)
            .frame(maxHeight: .infinity, alignment: .top)

            youAreHereMarker
            destinationMarker
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private var mapBackground: some View {
        GeometryReader { geo in
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: 60, y: 30))
                    path.addLine(to: CGPoint(x: 20, y: 260))
                    path.addLine(to: CGPoint(x: 80, y: 270))
                    path.addLine(to: CGPoint(x: 120, y: 60))
                    path.closeSubpath()
                }
                .fill(Color.white.opacity(0.2))

                Group {
                    roundedMapBlock(x: 40, y: 120, w: 140, h: 120, rotation: 12)
                    roundedMapBlock(x: 120, y: 40, w: 130, h: 80, rotation: 8)
                    roundedMapBlock(x: 250, y: 160, w: 160, h: 120, rotation: 8)
                    roundedMapBlock(x: 170, y: 240, w: 120, h: 340, rotation: 10)
                    roundedMapBlock(x: 120, y: 520, w: 160, h: 180, rotation: 10, borderColor: Color.cyan)
                }

                Text("Pharmacy")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.gray)
                    .rotationEffect(.degrees(10))
                    .position(x: 110, y: 120)

                Text("Waiting")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.gray)
                    .rotationEffect(.degrees(14))
                    .position(x: 80, y: 340)

                Text("Registration")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.gray)
                    .rotationEffect(.degrees(10))
                    .position(x: 170, y: 670)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }

    private func roundedMapBlock(
        x: CGFloat,
        y: CGFloat,
        w: CGFloat,
        h: CGFloat,
        rotation: Double,
        borderColor: Color = Color(.systemGray4)
    ) -> some View {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
            .fill(Color(.systemGray6))
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(borderColor, lineWidth: 2)
            )
            .frame(width: w, height: h)
            .rotationEffect(.degrees(rotation))
            .position(x: x + w / 2, y: y + h / 2)
    }

    private var levelSelector: some View {
        VStack(spacing: 0) {
            levelButton("L2", selected: selectedLevel == "L2")
            levelButton("L1", selected: selectedLevel == "L1")
            levelButton("G", selected: selectedLevel == "G")
        }
        .background(Color(.systemGray5).opacity(0.95))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    private func levelButton(_ title: String, selected: Bool) -> some View {
        Button {
            selectedLevel = title
        } label: {
            Text(title)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(selected ? Color.black : Color(.systemGray))
                .frame(width: 48, height: 48)
                .background(selected ? Color(red: 0.16, green: 0.87, blue: 0.83) : Color.clear)
        }
        .buttonStyle(.plain)
    }

    private var rightMapButtons: some View {
        VStack(spacing: 14) {
            circleIconButton(systemName: "square.stack.3d.up")
            circleIconButton(systemName: "scope")
        }
    }

    private func circleIconButton(systemName: String) -> some View {
        Button(action: {}) {
            Image(systemName: systemName)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color(.darkGray))
                .frame(width: 48, height: 48)
                .background(Color.white.opacity(0.95))
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 3)
        }
        .buttonStyle(.plain)
    }

    private var youAreHereMarker: some View {
        VStack(spacing: 10) {
            Text("You are here")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(Color(red: 0.06, green: 0.09, blue: 0.18))
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .rotationEffect(.degrees(8))

            ZStack {
                Circle()
                    .fill(Color(red: 0.16, green: 0.87, blue: 0.83).opacity(0.28))
                    .frame(width: 58, height: 58)

                Circle()
                    .fill(Color(red: 0.16, green: 0.87, blue: 0.83))
                    .frame(width: 20, height: 20)

                Circle()
                    .stroke(Color.white, lineWidth: 3)
                    .frame(width: 20, height: 20)
            }
        }
        .position(x: 238, y: 165)
    }

    private var destinationMarker: some View {
        Image(systemName: "mappin.circle.fill")
            .font(.system(size: 30))
            .foregroundColor(.red)
            .position(x: 120, y: 450)
    }
}

// MARK: - Bottom Sheet
extension MapScreenView {
    private var bottomSheet: some View {
        VStack(spacing: 0) {
            Capsule()
                .fill(Color(.systemGray4))
                .frame(width: 58, height: 6)
                .padding(.top, 12)
                .padding(.bottom, 18)

            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Registration Counter 3A")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color(.label))

                    Text("Main Hall, Level 1")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color(.systemGray))
                }

                Spacer()

                ZStack {
                    Circle()
                        .fill(Color(red: 0.16, green: 0.87, blue: 0.83).opacity(0.18))
                        .frame(width: 44, height: 44)

                    Image(systemName: "figure.walk")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color(red: 0.10, green: 0.73, blue: 0.70))
                }
            }
            .padding(.horizontal, 22)

            HStack(spacing: 18) {
                infoPill(icon: "clock", text: "3 min")
                infoPill(icon: "ruler", text: "120m")
                Spacer()
            }
            .padding(.horizontal, 22)
            .padding(.top, 22)

            Button(action: {}) {
                HStack(spacing: 12) {
                    Image(systemName: "location.north.line.fill")
                        .font(.system(size: 20, weight: .bold))
                    Text("Start Directions")
                        .font(.system(size: 22, weight: .bold))
                }
                .foregroundColor(Color(red: 0.04, green: 0.10, blue: 0.18))
                .frame(maxWidth: .infinity)
                .frame(height: 64)
                .background(Color(red: 0.16, green: 0.87, blue: 0.83))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 22)
            .padding(.top, 30)

            bottomNavBar
                .padding(.top, 18)
        }
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(Color.white)
                .ignoresSafeArea(edges: .bottom)
        )
        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: -4)
    }

    private func infoPill(icon: String, text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(.systemGray))

            Text(text)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color(.darkGray))
        }
        .padding(.horizontal, 14)
        .frame(height: 40)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }

    private var bottomNavBar: some View {
        HStack {
            navItem(systemName: "house", title: "Home", isSelected: false)
            Spacer()
            navItem(systemName: "list.bullet", title: "Queue", isSelected: false)
            Spacer()
            navItem(systemName: "map", title: "Map", isSelected: true)
            Spacer()
            navItem(systemName: "person", title: "Profile", isSelected: false)
        }
        .padding(.horizontal, 34)
        .padding(.vertical, 14)
        .background(Color.white)
    }

    private func navItem(systemName: String, title: String, isSelected: Bool) -> some View {
        VStack(spacing: 6) {
            ZStack(alignment: .top) {
                if isSelected {
                    Capsule()
                        .fill(Color(red: 0.16, green: 0.87, blue: 0.83))
                        .frame(width: 38, height: 4)
                        .offset(y: -10)
                }

                Image(systemName: systemName)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(isSelected ? Color(red: 0.10, green: 0.73, blue: 0.70) : Color(.systemGray2))
            }

            Text(title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(isSelected ? Color(red: 0.10, green: 0.73, blue: 0.70) : Color(.systemGray2))
        }
    }
}

// MARK: - Supporting Types
enum TopTab {
    case map
    case directions
}

// MARK: - Preview
struct MapScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MapScreenView()
    }
}
