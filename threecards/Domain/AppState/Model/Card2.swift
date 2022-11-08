//
//  Card2.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import Foundation

struct Card2: CardExpirable {
    var title: String
    var color: CardColor { .green }
    var name: String
    var cardNumber: String
    var expiryDate: Date
}
