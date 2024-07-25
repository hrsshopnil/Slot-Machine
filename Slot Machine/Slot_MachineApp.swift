//
//  Slot_MachineApp.swift
//  Slot Machine
//
//  Created by shopnil hasan on 21/7/24.
//

import SwiftUI

@main
struct Slot_MachineApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(gameLogic: GameLogic())
        }
    }
}
