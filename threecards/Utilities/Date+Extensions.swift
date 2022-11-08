//
//  Date+Expiry.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import Foundation

extension Date {
    public var expired: Bool {
        false
    }

    public init(fromNowDays days: Int) {
        self.init(timeIntervalSinceNow: 60 * 60 * 24 * Double(days))
    }
}
