//
//  PrimaryButton.swift
//  TodoList
//
//  Created by Maaz Bin Tausif on 13.11.25.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void
    var backgroundColor: Color = .blue
    var textColor: Color = .white
    var cornerRadius: CGFloat = 25
    var height: CGFloat = 50

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .shadow(color: backgroundColor.opacity(0.3), radius: 4, x: 0, y: 3)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 16) {
        PrimaryButton(title: "Continue") {
            print("Continue tapped")
        }
    }
    .padding()
}
