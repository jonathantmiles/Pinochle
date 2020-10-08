//
//  TurnHandler.swift
//  Pinochle
//
//  Created by Jonathan T. Miles on 10/8/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

class TurnHandler {
    /// Plays a card by appending to the tableau iff the card is legal. If it is not legal, returns without adding the card. (Needs some kind of error handling or interruption.) 
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
    
    /// Checks to see if the card either follows suit or if there are no cards matching the suit led in hand. If either is true, it returns true.
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
    
    /// Check trick for highest played card in suit led, or highest in trumps, if present. Returns index for winning player.
    func whoWins(inTableau tableau: inout Tableau, fromGameState gs: GameState) -> Int {
        
        var winnerToken: (cardRank: Int, playerIndex: Int?) = (0, nil)
        var playerIndex = gs.playerWhoLeads
        
        for card in tableau.tableau {
            var value = deck[card]!.value
            if deck[card]!.suit == gs.trumpSuit {
                value += 13
            } else if deck[card]!.suit != deck[tableau.tableau[0]]!.suit {
                value = 0
            }
            if value > winnerToken.cardRank {
                winnerToken = (value, playerIndex)
            }
            playerIndex += 1
            if playerIndex >= gs.players.count { playerIndex = 0 }
        }
        
        return winnerToken.playerIndex!
    }
    
    /// Assign cards taken in tricks to the winning partnership, set winning player to lead next trick, and clear the tableau.
    func cleanup(tableau: inout Tableau, inGameState gs: inout GameState) {
        
        let nextPlayerIndex = whoWins(inTableau: &tableau, fromGameState: gs)
        gs.playerWhoLeads = nextPlayerIndex
        let partnershipIndex = nextPlayerIndex % 2
        gs.partnerships[partnershipIndex]
            .takenTricks.append(contentsOf: tableau.tableau)
        tableau.tableau = []
    }
}
