//
//  ContentView.swift
//  Slot Machine
//
//  Created by shopnil hasan on 21/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showInfo = false
    @State private var animateReels = false
    @State private var animateModal = false
    @ObservedObject var gameLogic: GameLogic
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.colorPink, .colorPurple], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 5) {
                LogoView()
                Spacer()
                HStack{
                    HStack {
                        Text("Your\nCoins")
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        Text("\(gameLogic.coins)")
                            .modifier(ScoreModifier())
                    }
                    .modifier(ContainerModifier())
                    Spacer()
                    HStack {
                        Text("\(gameLogic.highScore)")
                            .modifier(ScoreModifier())
                        Text("High\nScore")
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ContainerModifier())
                }
                VStack(spacing: 0) {
                    ZStack {
                        ReelView()
                        Image(gameLogic.symbols[gameLogic.reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                            .opacity(animateReels ? 1 : 0)
                            .offset(y: animateReels ? 0 : -50)
                            .onAppear(perform: {
                                withAnimation(.easeInOut(duration: 0.8)) {
                                    animateReels.toggle()
                                }
                            })
                    }
                    HStack(alignment: .center, spacing: 0) {
                        ZStack {
                            ReelView()
                            Image(gameLogic.symbols[gameLogic.reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animateReels ? 1 : 0)
                                .offset(y: animateReels ? 0 : -50)
                                .onAppear(perform: {
                                    animateReels.toggle()
                                })
                        }
                        Spacer()
                        ZStack {
                            ReelView()
                            Image(gameLogic.symbols[gameLogic.reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animateReels ? 1 : 0)
                                .offset(y: animateReels ? 0 : -50)
                                .onAppear(perform: {
                                    animateReels.toggle()
                                })
                        }
                    }
                    .frame(maxWidth: 500)
                    Button {
                            animateReels = false
                        gameLogic.spinreels()
                        withAnimation(.easeInOut(duration: 0.8)) {
                            animateReels = true
                        }
                        gameLogic.checkWinning()
                        gameLogic.showNewGame()
                    }
                label:  {
                    ZStack {
                        ReelView()
                        Image(.gfxSpin)
                            .resizable()
                            .modifier(ImageModifier())
                    }
                }
                }//: VSTACK
                HStack {
                    Button {
                        gameLogic.activateBet20()
                    }
                label: {
                        HStack {
                            BetButtonView(betAmount: "20")
                                .foregroundStyle(gameLogic.betOn ? .yellow : .white)
                            Image(.gfxCasinoChips)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 64)
                                .modifier(ShadowModifier())
                                .opacity(gameLogic.betOn ? 1 : 0)
                                .offset(x: gameLogic.betOn ? 0 : 20)
                        }
                    }
                    Spacer()
                    Button {
                        gameLogic.activateBet10()
                    }
                label: {
                        HStack {
                            Image(.gfxCasinoChips)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 64)
                                .modifier(ShadowModifier())
                                .opacity(gameLogic.betOn ? 0 : 1)
                                .offset(x: gameLogic.betOn ? -20 : 0)
                            BetButtonView(betAmount: "10")
                                .foregroundStyle(gameLogic.betOn ? .white : .yellow)
                        }
                    }
                }
            }//: VSTACK
            .overlay(
                Button {
                    gameLogic.resetGame()
                } label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                }
                    .modifier(ButtonModifier()),
                alignment: .topLeading
            )
            .overlay(
                Button {
                    showInfo = true
                } label: {
                    Image(systemName: "info.circle")
                }
                    .modifier(ButtonModifier()),
                alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
            .blur(radius: gameLogic.newGame ? 8 : 0, opaque: false)
            if gameLogic.newGame {
                    NewGamePopupView() {
                        gameLogic.newGame = false
                        gameLogic.coins = 100
                        animateModal = false
                        gameLogic.activateBet10()
                    }
                    .opacity($animateModal.wrappedValue ? 1 : 0)
                    .offset(y: $animateModal.wrappedValue ? 0 : -100)
                    .onAppear(perform: {
                        withAnimation {
                            animateModal = true
                        }
                    })
            }
        }//: ZSTACK
        .sheet(isPresented: $showInfo) {
            InfoView()
        }
    }
}

#Preview {
    ContentView(gameLogic: GameLogic())
}
