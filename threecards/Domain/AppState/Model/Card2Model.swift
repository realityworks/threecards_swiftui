//
//  Card2Model.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import Foundation

struct Card2Model: CardExpirable {
    var title: String
    var color: CardColor { .green }
    var name: String
    var cardNumber: String
    var expiryDate: Date
    var dataString: String {
        "type2" + title + name + cardNumber + expiryDate.description
    }
}
