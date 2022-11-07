//
//  CardItem.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import Foundation

struct CardItem: Identifiable {
    var id: Int
    var originalPosition: Int {
        id
    }

    var displayable: any CardDefinable
}

extension CardItem: Equatable {
    static func == (lhs: CardItem, rhs: CardItem) -> Bool {
        lhs.id == rhs.id
    }
}

extension CardItem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(displayable)
    }
}
