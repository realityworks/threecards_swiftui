//
//  UserAccountUseCase.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import Foundation

class UserAccountUseCase: UseCase {
    typealias State = UserAccountState
    var lens: StateAccess {
        \.userAccount
    }

    required init(dependencies: Dependencies = .mock) {
        
    }

    func select(_ card: CardItem) {
        if let expiredCard = card.cardDefinition as? any CardExpirable {
            guard !expiredCard.expired else {
                internalError(with: DomainError(with: "Card is expired!!"))
                return
            }
        }
        
        state.selectedCard = card
    }

    func deselectCard() {
        state.selectedCard = nil
    }

    func move(from indexSet: IndexSet, to position: Int) {
        guard indexSet.allSatisfy({ $0 < state.cards.count}) else {
            internalError(with: "An item in the index set is out of range")
            return
        }

        guard position < state.cards.count else {
            internalError(with: "Offset position is out of range")
            return
        }

        state.cards.move(fromOffsets: indexSet, toOffset: position)
    }

    func remove(cardAtPosition position: Int) {
        guard position < state.cards.count else {
            internalError(with: "Internal: Invalid position to delete card \(position)")
            return
        }

        state.cards.remove(at: position)
    }

    func resetList() {
        state.cards = state.originalCards
    }
}


// MARK: Dependencies extension

extension UserAccountUseCase {
    // Normally here we would have service dependency injection (like database etc..)
    struct Dependencies: DependencyConformance {
        static var live: Dependencies = .init(
        )
        
        static var mock: Dependencies = .init(
        )
    }
}

