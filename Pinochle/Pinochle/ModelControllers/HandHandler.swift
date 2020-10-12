//
//  HandHandler.swift
//  Pinochle
//
//  Created by Jonathan T. Miles on 10/12/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

class HandHandler {
    
    ///Returns a SortedPile with each suit in its own Pile sorted in descending rank. Suits ordered according to the suitsSorted declaration.
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
    
    ///Same as 'split(hand:)' except it orders the Trump suit first, and keeps alternating colors according to the suitsSorted declaration.
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
    
    ///Takes a normal SortedPile (not prettySplit) and tells whether there are any cards in the suit of the card currenlty winning the trick (assuming it was played legally).
    func canBeat(cardID: Int, fromSortedHand hand: SortedPile, whereTrump trump: Character) -> Bool {
        let suitIndex = suitsSorted.firstIndex(of:deck[cardID]!.suit)!
        let trumpIndex = suitsSorted.firstIndex(of: trump)!
        
        if hand[suitIndex].isEmpty && hand[trumpIndex].isEmpty {
            return false
        } else if !hand[suitIndex].isEmpty && deck[hand[suitIndex].first!]!.value > deck[cardID]!.value {
            return true
        } else if suitIndex != trumpIndex {
            if hand[suitIndex].isEmpty && !hand[trumpIndex].isEmpty {
                return true
            }
        }
        
        return false
     }
    
    func canFollowSuit(cardID: Int, fromSortedHand hand: SortedPile) -> Bool {
        let suitIndex = suitsSorted.firstIndex(of:deck[cardID]!.suit)!
        if hand[suitIndex].isEmpty { return false }
        return true
    }
    // beat with highest card in suit; if no cards in suit, trump low; if no cards in trump, play off suit
    func takeTrickIfPossible(fromHand hand: SortedPile, towardHighestCard cardID: Int, whereTrump trump: Character) -> Int {
        let suitIndex = suitsSorted.firstIndex(of:deck[cardID]!.suit)!
        let trumpIndex = suitsSorted.firstIndex(of: trump)!
        
        let beatable = canBeat(cardID: cardID, fromSortedHand: hand, whereTrump: trump)
        let followable = canFollowSuit(cardID: cardID, fromSortedHand: hand)
        
        switch (beatable, followable) {
        case (true, true):
            //play highest card in suit led
            return hand[suitIndex].first!
        case (true, false):
            // play lowest trump
            return hand[trumpIndex].last!
        case (false, true):
            // play lowest card in suit led
            return hand[suitIndex].last!
        case (false, false):
            //play offsuit in suit with least cards held
            var offSuitCandidates: Set<Int> = [0, 1, 2, 3]
            offSuitCandidates.remove(trumpIndex)
            offSuitCandidates.remove(suitIndex)
            var suitWithLeastCardsHeld = offSuitCandidates.first!
            
            for suit in offSuitCandidates {
                if !hand[suit].isEmpty {
                    if suitWithLeastCardsHeld > hand[suit].count {
                        suitWithLeastCardsHeld = suit
                        
                    }
                }
            }
            return hand[suitWithLeastCardsHeld].last!
        }
    }
    
}
