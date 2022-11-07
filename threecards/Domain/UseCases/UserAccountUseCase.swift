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
}


// MARK: Dependencies extension

extension UserAccountUseCase {
    struct Dependencies: DependencyConformance {

        static var live: Dependencies = .init(
        )
        
        static var mock: Dependencies = .init(
        )
    }
}

