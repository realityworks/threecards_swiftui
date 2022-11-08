//
//  CardDefinable.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import Foundation
import CoreGraphics

enum CardColor {
    case green
    case blue
    case purple
}

protocol CardDefinable: Equatable, Hashable {
    var title: String { get }
    var color: CardColor { get }
    var dataString: String { get }
}
