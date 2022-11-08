//
//  UserAccount.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import Foundation

struct UserAccountState: UseCaseState {
    var cards: [CardItem] = [
        CardItem(
            id: 0,
            cardDefinition: Card1(
                title: "First Card",
                name: "David Hasselhof"
            )
        ),
        CardItem(
            id: 1,
            cardDefinition: Card2(
                title: "Second Card",
                name: "Bab Sagett",
                cardNumber: "123123231",
                expiryDate: Date(fromNowDays: 10)
            )
        ),
        CardItem(
            id: 2,
            cardDefinition: Card2(
                title: "Third Card",
                name: "Mark Bronson",
                cardNumber: "232123221",
                expiryDate: Date(fromNowDays: 5)
            )
        ),
        CardItem(
            id: 3,
            cardDefinition: Card2(
                title: "Another Card",
                name: "Mark Bronson",
                cardNumber: "4232123",
                expiryDate: Date(fromNowDays: 20)
            )
        ),
        CardItem(
            id: 4,
            cardDefinition: Card1(
                title: "One Card",
                name: "Steven bobs"
            )
        ),
        CardItem(
            id: 5,
            cardDefinition: Card1(
                title: "Card type 1",
                name: "BlinkenBlob"
            )
        ),
        CardItem(
            id: 6,
            cardDefinition: Card3(
                title: "Wow Card Type 3",
                firstName: "Geoff",
                lastName: "Bloom",
                cardId: .init(),
                referenceNumber: "15",
                expiryDate: Date(fromNowDays: 16)
            )
        ),
        CardItem(
            id: 7,
            cardDefinition: Card2(
                title: "This is a card",
                name: "StackOverflow",
                cardNumber: "123199888",
                expiryDate: Date(fromNowDays: -5)
            )
        ),
        CardItem(
            id: 8,
            cardDefinition: Card2(
                title: "Not another card",
                name: "What's in a name?",
                cardNumber: "12322211",
                expiryDate: Date(fromNowDays: 103)
            )
        ),
        CardItem(
            id: 9,
            cardDefinition: Card3(
                title: "LastCard?",
                firstName: "Pretzel",
                lastName: "Polak",
                cardId: .init(),
                referenceNumber: "15",
                expiryDate: Date(fromNowDays: 2)
            )
        )
    ]
}
