//
//  CardExpirable.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import Foundation

protocol CardExpirable: CardDefinable {
    var expiryDate: Date { get }
}

extension CardExpirable {
    var expired: Bool {
        expiryDate.expired
    }
}
