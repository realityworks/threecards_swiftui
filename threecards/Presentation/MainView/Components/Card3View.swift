//
//  Card3View.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import SwiftUI

struct Card3View: View {
    var cardData: Card3Model
    var body: some View {
        VStack(spacing: 20) {
            CardViewHeader(
                title: cardData.title,
                color: cardData.color.swiftUIColor
            )

            Text(cardData.firstName + " " + cardData.lastName)
                .font(.headline)
            Text("Reference: " + cardData.referenceNumber)
                .font(.headline)
            Text("Expiry: " + cardData.expiryDate.formatted())
                .font(.subheadline)

            Spacer()
            QRCodeView(dataString: cardData.dataString)
            Text(cardData.cardId.uuidString)
                .font(.caption)
            Spacer()
        }
    }
}

struct Card3View_Previews: PreviewProvider {
    static var previews: some View {
        Card3View(
            cardData: Card3Model(
                title: "Test Card 3",
                firstName: "Peter",
                lastName: "Suwara",
                cardId: .init(),
                referenceNumber: "2312312",
                expiryDate: Date(fromNowDays: 20)
            )
        )
    }
}
