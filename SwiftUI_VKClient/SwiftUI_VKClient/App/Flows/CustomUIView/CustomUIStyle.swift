//
//  CustomUIStyle.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 21.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: - Button style

struct CustomButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(.blue)
            .foregroundColor(.black)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
}

// MARK: - View builder

struct AvatarImageViewBuilder: View {
    
    var content: WebImage
    init(@ViewBuilder content: () -> WebImage) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .frame(width: 50, height: 50, alignment: .center)
            .modifier(CircleShadow(shadowColor: .blue, shadowRadius: 10))
    }
    
}

struct TextBuilder: View {
    
    var content: Text
    init(@ViewBuilder content: () -> Text) {
        self.content = content()
        }
    var body: some View {
        content
            .font(.system(size: 14, weight: .medium, design: .default))
    }
    
}

// MARK: - View modifier

struct CircleShadow: ViewModifier {
    
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.blue, lineWidth: 1.5))
            .background(Circle()
                .fill(Color.white)
                .shadow(color: shadowColor, radius: shadowRadius))
    }
    
}
