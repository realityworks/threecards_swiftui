//
//  Color+Extensions.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import SwiftUI

extension Color {
    static var appBackground: Color = Color("Background")
    static var appForegroundBright: Color = Color("ForegroundBright")
    static var appForegroundDark: Color = Color("ForegroundDark")
    static var appBlue: Color = Color("Blue")
    static var appGreen: Color = Color("Green")
    static var appPurple: Color = Color("Purple")
}

extension CardColor {
    var swiftUIColor: Color {
        switch self {
        case .blue:
            return .appBlue
        case .green:
            return .appGreen
        case .purple:
            return .appPurple
        }
    }
}
