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
        var valueTicker: Int = 10
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
            
            let pointerActual: Bool = (valueTicker > 12 && valueTicker < 16 ? true : false)
            
            var rankActual: String = ""
            switch valueTicker {
            case 10:
                rankActual = "9"
            case 11:
                rankActual = "J"
            case 12:
                rankActual = "Q"
            case 13:
                rankActual = "K"
            case 14:
                rankActual = "10"
            case 15:
                rankActual = "A"
                suitTicker += 1
            default:
                break
            }
            
            let playingCard = PlayingCard(value: valueTicker, rank: rankActual, suit: suitActual, isFace: faceActual, isPointer: pointerActual, uniqueID: uniqueIndexTicker)
            deckAccumulator[uniqueIndexTicker] = playingCard
            
            valueTicker += 1
            if valueTicker > 15 { valueTicker = 10 }
            if playingCard.report == "AD" { suitTicker = 0 }
            uniqueIndexTicker += 1
        }
        
        return deckAccumulator
    }
}
