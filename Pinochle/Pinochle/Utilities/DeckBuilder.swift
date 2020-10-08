//
//  DeckBuilder.swift
//  Pinochle
//
//  Created by Jonathan T. Miles on 10/8/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import Foundation

class DeckBuilder {
    func constructDeck() -> DeckStandard {
        var deckAccumulator = DeckStandard()
        
        var suitTicker: Int = 0
        var valueTicker: Int = 9
        var uniqueIndexTicker: Int = 0
        
        while uniqueIndexTicker < 48 {
            var suitActual: Character
            switch suitTicker {
            case 0:
                suitActual = "S"
            case 1:
                suitActual = "H"
            case 2:
                suitActual = "C"
            case 3:
                suitActual = "D"
            default:
                suitActual = "Z"
            }
            
            let faceActual: Bool = (valueTicker > 10 && valueTicker < 14 ? true : false)
            
            var rankActual: String
            switch valueTicker {
            case 11:
                rankActual = "J"
            case 12:
                rankActual = "Q"
            case 13:
                rankActual = "K"
            case 14:
                rankActual = "A"
                suitTicker += 1
            default:
                rankActual = String(valueTicker)
            }
            
            let playingCard = PlayingCard(value: valueTicker, rank: rankActual, suit: suitActual, isFace: faceActual, uniqueID: uniqueIndexTicker)
            deckAccumulator[uniqueIndexTicker] = playingCard
            
            valueTicker += 1
            if valueTicker > 14 { valueTicker = 9 }
            if playingCard.report == "AD" { suitTicker = 1 }
            uniqueIndexTicker += 1
        }
        
        return deckAccumulator
    }
}
