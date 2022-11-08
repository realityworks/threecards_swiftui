//
//  Card1View.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import SwiftUI

struct Card1View: View {
    var cardData: Card1
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Card1View_Previews: PreviewProvider {
    static var previews: some View {
        Card1View(cardData: Card1(title: "TestTitle", name: "This is my name"))
    }
}
