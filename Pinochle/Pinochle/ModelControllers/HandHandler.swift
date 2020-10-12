//
//  HandHandler.swift
//  Pinochle
//
//  Created by Jonathan T. Miles on 10/12/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

class HandHandler {
    
    /// Returns a SortedPile with each suit in its own Pile sorted in descending rank. Suits ordered according to the suitsSorted declaration.
    func split(hand: Pile) -> SortedPile {
        var sortedHand = Array(repeating: Pile(), count: 4)
        var indexOfSuit = 0
        
        while sortedHand[0].count + sortedHand[1].count + sortedHand[2].count + sortedHand[3].count < hand.count {
            var suitSplit: Pile = []
            for id in hand {
                if deck[id]!.suit == suitsSorted[indexOfSuit] {
                    suitSplit.append(id)
                }
            }
            suitSplit.sort { deck[$0]!.value > deck[$1]!.value }
            sortedHand[indexOfSuit] = suitSplit
            indexOfSuit = (indexOfSuit < 3 ? indexOfSuit + 1 : 0)
        }
        
        return sortedHand
    }
    
    /// Same as 'split(hand:)' except it orders the Trump suit first, and keeps alternating colors according to the suitsSorted declaration.
    func splitPretty(hand: Pile, preferringTrump trump: Character) -> SortedPile {
        var sortedHand = Array(repeating: Pile(), count: 4)
        var indexOfSuit = suitsSorted.firstIndex(of: trump)!
        
        while sortedHand[0].count + sortedHand[1].count + sortedHand[2].count + sortedHand[3].count < hand.count {
            var suitSplit: Pile = []
            for id in hand {
                if deck[id]!.suit == suitsSorted[indexOfSuit] {
                    suitSplit.append(id)
                }
            }
            suitSplit.sort { deck[$0]!.value > deck[$1]!.value }
            sortedHand[indexOfSuit] = suitSplit
            indexOfSuit = (indexOfSuit < 3 ? indexOfSuit + 1 : 0)
        }
        
        return sortedHand
    }
    
    func highestCard(inSuit suit: Character, fromHand hand: SortedPile) -> Int {
        var indexOfSuit = suitsSorted.firstIndex(of: suit)!
        
        
        return 0
    }
    
}
