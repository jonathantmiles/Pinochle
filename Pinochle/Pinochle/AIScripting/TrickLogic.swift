//
//  TrickLogic.swift
//  Pinochle
//
//  Created by Jonathan T. Miles on 10/8/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation


// take a tableau and own player number, plus index of player who led
// check for highest card played (which player index)
// can you beat it? if no, play a pointer if possible, or follow suit as low as possible or play a low-ranked off-suit
// if yes, is the trick being led by your partner? if yes, don't beat it if possible
// if no, beat it

// helper method: find highest card in hand in suit
// OR: order cards in hand according to suit; maybe split into arrays for each suit, ordered high to low
