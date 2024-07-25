//
//  ReelView.swift
//  Slot Machine
//
//  Created by shopnil hasan on 21/7/24.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image(.gfxReel)
            .resizable()
            .modifier(ImageModifier())
    }
}

#Preview {
    ReelView()
}
