//
//  Card1Model.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import Foundation
import CoreGraphics

struct Card1Model: CardDefinable {
    var title: String
    var color: CardColor { .blue }
    var name: String
    var dataString: String {
        "type1" + title + name
    }
}
