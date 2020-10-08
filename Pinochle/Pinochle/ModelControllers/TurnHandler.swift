//
//  TurnHandler.swift
//  Pinochle
//
//  Created by Jonathan T. Miles on 10/8/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

class TurnHandler {
    func playCard(withID id: Int, fromHand hand: inout Pile, toTableau tableau: inout Tableau) {
        
        // leading card is always legal
        if tableau.tableau.isEmpty {
             tableau.suitLed = deck[id]!.suit
        } else {
            if checkLegality(ofCardWithID: id, fromPlayerHand: hand, wrtSuitLed: tableau.suitLed) == false { return }
        }
        tableau.tableau.append(id)
        let index = hand.firstIndex(of: id)!
        hand.remove(at: index)
    }
    
    func checkLegality(ofCardWithID id: Int, fromPlayerHand hand: Pile, wrtSuitLed suit: Character) -> Bool {
        
        if deck[id]?.suit == suit { return true }
        
        // make a set of suits for cards in hand except the played card
        var suitsInHand: Set<Character> = []
        for card in hand {
            if id != card {
                let suit = deck[card]!.suit
                suitsInHand.insert(suit)
            }
        }
        
        if suitsInHand.contains(suit) { return false }
        
        return false
    }
    
    // once last card is played, check for highest rank
    func whoWins(inTableau: inout Tableau) -> Player {
        return Player()
    }
}
