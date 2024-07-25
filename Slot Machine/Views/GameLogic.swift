//
//  GameLogic.swift
//  Slot Machine
//
//  Created by shopnil hasan on 21/7/24.
//

import SwiftUI

class GameLogic: ObservableObject {
    
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry",]
    @Published var reels = [1,2,3]
    @Published var highScore = UserDefaults.standard.value(forKey: "highScore") as? Int ?? 0
    @Published var coins = UserDefaults.standard.value(forKey: "coins") as? Int ?? 100
    @Published var betAmount = 10
    @Published var betOn = false
    @Published var newGame = false
    func spinreels() {
        reels = reels.map { _ in
            Int.random(in: 0...symbols.count - 1)
        }
    }
    
    func checkWinning() {
        if reels[0] == reels[1] && reels[1] == reels[2]{
            playerWins()
            if highScore < coins {
                newHighScore()
            }
        } else {
            playerLoses()
        }
    }
    
    func playerWins() {
        coins += betAmount * 10
        UserDefaults.standard.setValue(coins, forKey: "coins")
    }
    
    func newHighScore() {
        highScore = coins
        UserDefaults.standard.setValue(highScore, forKey: "highScore")
    }
    
    func playerLoses() {
        coins -= betAmount
        UserDefaults.standard.setValue(coins, forKey: "coins")
    }
    
    func activateBet10() {
        betAmount = 10
        betOn = false
    }
    
    func activateBet20() {
        betAmount = 20
        betOn = true
    }
    
    func showNewGame() {
        if coins <= 0 {
            newGame = true
        }
    }
    
    func resetGame(){
        UserDefaults.standard.setValue(0, forKey: "highScore")
        UserDefaults.standard.setValue(100, forKey: "coins")
        highScore = 0
        coins = 100
        activateBet10()
    }
}
