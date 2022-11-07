//
//  Card2.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import Foundation

struct Card2: CardDefinable {
    var title: String
    var color: String { "#00FF00" }
    var name: String
    var cardNumber: String
    var expiryDate: Date
}
