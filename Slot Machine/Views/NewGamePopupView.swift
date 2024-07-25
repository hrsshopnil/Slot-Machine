//
//  NewGamePopupView.swift
//  Slot Machine
//
//  Created by shopnil hasan on 22/7/24.
//

import SwiftUI

struct NewGamePopupView: View {
    let onTap: () -> Void
    var body: some View {
        VStack {
           Text("Game Over")
                .font(.system(size: 32, weight: .heavy, design: .rounded))
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.colorPink)
            Spacer()
            VStack {
                Image("gfx-seven-reel")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 72)
                
                Text("Bad luck! You lost all of your coins. \n Let's play again!")
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
            Button {
                onTap()
            } label: {
                Text("NEW GAME")
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(.colorPink)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .frame(minWidth: 128)
                    .background(
                    Capsule()
                        .strokeBorder(lineWidth: 2.5)
                        .foregroundStyle(.colorPink)
                    )
            }
            .padding(.bottom)
        }
        .background(.white)
        .cornerRadius(30)
        .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
        
    }
}

#Preview {
    NewGamePopupView() {
        
    }
}
