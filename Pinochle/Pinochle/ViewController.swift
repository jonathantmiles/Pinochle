//
//  ViewController.swift
//  Pinochle
//
//  Created by Jonathan T. Miles on 10/8/20.
//  Copyright © 2020 Jonathan T. Miles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }

    func setup() {
        let deck = DeckBuilder().constructDeck()
        var reports: [String] = []
        for card in 0..<deck.count {
            reports.append(deck[card]!.report)
        }
        print(reports)
        print(deck.count)
    }

}

