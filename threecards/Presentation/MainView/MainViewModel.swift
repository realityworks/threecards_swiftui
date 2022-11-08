//
//  MainViewModel.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var cardData: [CardItem] = []
    @Published var selectedCard: CardItem?

    private let userAccountUseCase: UserAccountUseCase

    init(dependencies: Dependencies = .default) {
        self.userAccountUseCase = dependencies.userAccountUseCase

        dependencies
            .cardData
            .print("CARD DATA:")
            .assign(to: &$cardData)
    }

    func cardWasSelected() {
        selectedCard = CardItem(id: 1, cardDefinition: Card1(title: "test", name: "test"))
    }
}


extension MainViewModel {
    // Not the DI is well suited for Unit testing.
    struct Dependencies {
        var cardData: SafePublisher<[CardItem]>
        var userAccountUseCase: UserAccountUseCase

        static var `default`: Dependencies = {
            Dependencies(
                cardData: Domain.instance.stateController.publisher(for: \.userAccount.cards),
                userAccountUseCase: Domain.instance.useCase(UserAccountUseCase.self)
            )
        }()
    }
}
