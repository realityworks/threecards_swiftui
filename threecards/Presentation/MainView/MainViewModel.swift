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
    @Published var editEnabled: Bool = false

    let errorAlertManager: AlertOverlayManager
    private let userAccountUseCase: UserAccountUseCase

    init(dependencies: Dependencies = .default) {
        self.userAccountUseCase = dependencies.userAccountUseCase
        // Setup the error alert stream
        let errorAlertStream = dependencies.errorStream
            .map { AlertState(title: $0.errorDescription ?? "Unknown Error") }

        errorAlertManager = AlertOverlayManager(
            alertState: errorAlertStream.eraseToAnyPublisher()
        )

        dependencies
            .cardData
            .print("CARD DATA:")
            .assign(to: &$cardData)

        dependencies
            .selectedCard
            .print("SELECTED CARD:")
            .assign(to: &$selectedCard)
    }

    func cardWasSelected(_ card: CardItem) {
        userAccountUseCase.select(card)
    }

    func toggleEdit() {
        editEnabled.toggle()
    }
}


extension MainViewModel {
    // Not the DI is well suited for Unit testing.
    struct Dependencies {
        var errorStream: SafePublisher<DomainError>
        var cardData: SafePublisher<[CardItem]>
        var selectedCard: SafePublisher<CardItem?>
        var userAccountUseCase: UserAccountUseCase

        static var `default`: Dependencies = {
            Dependencies(
                errorStream: Domain.instance.stateController.errorSubject.eraseToAnyPublisher(),
                cardData: Domain.instance.stateController.publisher(for: \.userAccount.cards),
                selectedCard: Domain.instance.stateController.publisher(for: \.userAccount.selectedCard),
                userAccountUseCase: Domain.instance.useCase(UserAccountUseCase.self)
            )
        }()
    }
}
