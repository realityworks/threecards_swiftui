//
//  CardSheetContainerView.swift
//  threecards
//
//  Created by Piotr Suwara on 9/11/2022.
//

import SwiftUI

struct CardSheetContainerView: View {
    // Model
    var cardItem: CardItem

    // Animation
    @State private var show = false

    var body: some View {
        ScrollView {
            Self.viewFor(definable: cardItem.cardDefinition)
                .padding(.top, 24)
        }
        .offset(y: show ? 8 : 1024)
        .animation(
            .spring(response: 1.0, dampingFraction: 0.8),
            value: show
        )
        .onAppear {
            show.toggle()
        }
    }

    static func viewFor(definable: any CardDefinable) -> some View {
        Group {
            switch definable.self {
            case let card1 as Card1Model:
                Card1View(cardData: card1)
            case let card2 as Card2Model:
                Card2View(cardData: card2)
            case let card3 as Card3Model:
                Card3View(cardData: card3)
            default:
                EmptyView()
            }
        }
    }
}

struct CardSheetContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CardSheetContainerView(
            cardItem: CardItem(
                id: 0,
                cardDefinition: Card1Model(
                    title: "TEST",
                    name: "TEST NAME")
            )
        )
    }
}
