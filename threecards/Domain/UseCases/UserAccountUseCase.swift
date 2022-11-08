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

    func move(card: CardItem, toPositionInList position: Int) {

    }

    func remove(card: CardItem) {

    }

    func resetList() {
        
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

