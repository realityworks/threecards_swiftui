//
//  Card3.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import Foundation

struct Card3: CardDefinable {
    var title: String
    var color: String { "#FF00FF" }
    var firstName: String
    var lastName: String
    var cardId: UUID
    var referenceNumber: String
    var expiryDate: Date
}
