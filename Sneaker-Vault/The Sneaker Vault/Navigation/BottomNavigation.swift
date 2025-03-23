//
//  BottomNavigation.swift
//  The Sneaker Vault
//
//  Created by Carlos Alleng on 2025-03-17.
//

import SwiftUI

struct BottomNavigation: View {
    var body: some View {
        HStack {
            TabButton(icon: "house.fill", isSelected: true)
            TabButton(icon: "heart", isSelected: false)
            TabButton(icon: "bag", isSelected: false)
            TabButton(icon: "person", isSelected: false)
        }
        .padding(.vertical, 10)
        .background(Color.white)
        .cornerRadius(15, corners: [.topLeft, .topRight])
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: -5)
    }
}

struct TabButton: View {
    let icon: String
    let isSelected: Bool
    
    var body: some View {
        Button(action: {}) {
            VStack(spacing: 5) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(isSelected ? .black : .gray)
                
                if isSelected {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 5, height: 5)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

// Extension for applying rounded corners only to certain corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

