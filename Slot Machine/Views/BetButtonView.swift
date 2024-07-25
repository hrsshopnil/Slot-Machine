//
//  BetButtonView.swift
//  Slot Machine
//
//  Created by shopnil hasan on 21/7/24.
//

import SwiftUI

struct BetButtonView: View {
    let betAmount: String
    var body: some View {
        Text(betAmount)
            .font(.system(size: 26, weight: .bold, design: .rounded))
            .frame(width: 80)
            .padding(.vertical, 4)
            .padding(.horizontal, 20)
            .background(
            Capsule()
                .fill(LinearGradient(colors: [.colorPink, .colorPurple], startPoint: .top, endPoint: .bottom))
            )
            .padding(3)
            .background(
                Capsule()
                    .fill(LinearGradient(colors: [.colorPurple, .colorPink], startPoint: .top, endPoint: .bottom))
            )
    }
}

#Preview {
    BetButtonView(betAmount: "10")
}
