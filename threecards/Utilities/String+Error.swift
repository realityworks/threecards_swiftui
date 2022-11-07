//
//  String+Error.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? {
        return self
    }
}
