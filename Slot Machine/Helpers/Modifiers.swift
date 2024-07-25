//
//  Modifiers.swift
//  Slot Machine
//
//  Created by shopnil hasan on 21/7/24.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .colorTransparentBlack, radius: 0, x: 0, y: 6)
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundStyle(.white)
    }
}

struct ScoreModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.heavy)
            .shadow(color: .colorTransparentBlack, radius: 0, x: 0, y: 3)
    }
}

struct ContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            .background(
            Capsule()
                .foregroundStyle(.colorTransparentBlack)
            )
    }
}

struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 140, idealWidth: 200, maxWidth: 220, minHeight: 130, idealHeight: 190, maxHeight: 200, alignment: .center)
            .modifier(ShadowModifier() )
    }
}
