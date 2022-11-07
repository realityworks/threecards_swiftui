//
//  CardDefinable.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import Foundation
import CoreGraphics

protocol CardDefinable: Equatable, Hashable {
    var title: String { get }
    var color: String { get }
}
