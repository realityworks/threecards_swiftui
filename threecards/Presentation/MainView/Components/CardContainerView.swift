//
//  CardView.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import SwiftUI

struct CardContainerView: View {
    // Model
    var card: any CardDefinable

    // Environment
    @Environment(\.verticalSizeClass) var verticalSizeClass

    // Animation
    @State private var show = false

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
                        .shadow(radius: 10)

                    Text("TAP")
                        .font(verticalSizeClass == .regular ? .title3 : .title2 )
                        .foregroundColor(.appForegroundBright)
                }
            }
            .frame(maxHeight: verticalSizeClass == .regular ? 96 : 128)
            .padding(.horizontal, 4)
        }
        .background(Color.appBackground)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    isExpired ? .red : Color.appForegroundDark,
                    lineWidth: isExpired ? 5 : 1
                )
                .scaleEffect(show ? 1 : isExpired ? 1.01 : 1)
                .opacity(show ? 1 : isExpired ? 0 : 1)
                .animation(
                    .easeOut(duration: 0.5)
                        .repeatForever(),
                    value: show
                )
        )
        .onAppear {
            show.toggle()
        }
    }

    var isExpired: Bool {
        if let expirableCard = card as? any CardExpirable,
           expirableCard.expired {
            return true
        }

        return false
    }
}

struct CardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CardContainerView(
            card: Card1Model(
                title: "Test Card 1",
                name: "Name Test")
        )
        CardContainerView(
            card: Card2Model(
                title: "Test Card 2",
                name: "Name Test",
                cardNumber: "123123123",
                expiryDate: Date(fromNowDays: 10)
            )
        )
        CardContainerView(
            card: Card3Model(
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

