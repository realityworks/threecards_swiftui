//
//  Card2View.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import SwiftUI

struct Card2View: View {
    var cardData: Card2Model
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CardViewHeader(
                    title: cardData.title,
                    color: cardData.color.swiftUIColor
                )
                .frame(minHeight: 150)

                Text(cardData.name)
                    .font(.headline)
                Text("Number:" + cardData.cardNumber)
                    .font(.subheadline)
                Text("Expiry:" + cardData.expiryDate.formatted())
                    .font(.subheadline)

                Spacer()
                QRCodeView(dataString: cardData.dataString)
                Spacer()
            }
        }
    }
}

struct Card2View_Previews: PreviewProvider {
    static var previews: some View {
        Card2View(
            cardData: Card2Model(
                title: "Test Card 2",
                name: "Name Test",
                cardNumber: "123123123",
                expiryDate: Date(fromNowDays: 10)
            )
        )
    }
}
