//
//  PlayingCard.swift
//  Pinochle
//
//  Created by Jonathan T. Miles on 10/8/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

struct PlayingCard: Hashable {
    let value: Int
    let rank: String
    let suit: Character
    let isFace: Bool
    let isPointer: Bool
    let uniqueID: Int
    var report: String { rank + String(suit) }
}
