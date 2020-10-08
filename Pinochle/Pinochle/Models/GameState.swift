//
//  GameState.swift
//  Pinochle
//
//  Created by Jonathan T. Miles on 10/8/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

struct GameState {
    var partnerships: [Partnership]
    var players: [Player]
    var playerWhoLeads: Int
    
    var stock: Pile
    var discardPile: Pile
    let isDiscardVisible: Bool
    
    var tableau: [Pile]
    var suitLead: String
    
    var bid: Int
    var winningBidder: Partnership
    var trumpSuit: Character
}
