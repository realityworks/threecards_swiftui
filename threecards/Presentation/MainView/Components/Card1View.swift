//
//  Card1View.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import SwiftUI

struct Card1View: View {
    var cardData: Card1Model
    var body: some View {
        VStack(spacing: 20) {
            CardViewHeader(
                title: cardData.title,
                color: cardData.color.swiftUIColor
            )

            Text(cardData.name)
                .font(.headline)

            Spacer()
            QRCodeView(dataString: cardData.dataString)
            Spacer()
        }
    }
}

struct Card1View_Previews: PreviewProvider {
    static var previews: some View {
        Card1View(cardData: Card1Model(title: "TestTitle", name: "This is my name"))
    }
}
