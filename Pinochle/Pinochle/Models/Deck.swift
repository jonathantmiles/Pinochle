//
//  Deck.swift
//  Pinochle
//
//  Created by Jonathan T. Miles on 10/8/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

typealias DeckStandard = [Int : PlayingCard]
typealias Pile = [Int]
typealias SortedPile = [Pile]

let deck = DeckBuilder().constructDeck()
let suitsSorted: [Character] = ["S", "D", "C", "H"]
