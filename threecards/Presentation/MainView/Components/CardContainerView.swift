//
//  CardView.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import SwiftUI

struct CardContainerView: View {
    var card: any CardDefinable

    @Environment(\.verticalSizeClass) var verticalSizeClass

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(card.title)
                        .font(.title)
                        .foregroundColor(.appForegroundDark)
                    Spacer()
                    Rectangle()
                        .frame(maxHeight: 1)
                        .foregroundColor(.appForegroundDark)
                }
                Spacer()
                ZStack {
                    Circle()
                        .foregroundColor(card.color.swiftUIColor)
                    Text("TAP")
                        .font(verticalSizeClass == .regular ? .title3 : .title2 )
                        .foregroundColor(.appForegroundBright)
                }
            }
            .frame(maxHeight: verticalSizeClass == .regular ? 96 : 128)
            .padding(.horizontal, 4)
        }
        .background(Color.appBackground)
    }
}

struct CardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CardContainerView(
            card: Card1(
                title: "Test Card 1",
                name: "Name Test")
        )
        CardContainerView(
            card: Card2(
                title: "Test Card 2",
                name: "Name Test",
                cardNumber: "123123123",
                expiryDate: Date(fromNowDays: 10)
            )
        )
        CardContainerView(
            card: Card3(
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

