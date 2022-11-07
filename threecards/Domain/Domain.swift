//
//  Domain.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import Foundation
import Combine

class Domain {
    static var instance: Domain = Domain()

    let stateController: AppStateController
    let useCases: UseCases

    init(dependencies: Dependencies = .shared) {
        self.stateController = dependencies.state
        self.useCases = dependencies.useCases
    }

    func useCase<T: UseCase>(_ type: T.Type) -> T {
        do {
            return try useCases.useCase(type)
        } catch {
            // Unable to continue if a usecase is not
            fatalError("Underlying error with use cases: \(error)")
        }
    }

    static var previewState: AppState {
        get {
            Self.instance.stateController.state
        }

        set {
            Self.instance.stateController.state = newValue
        }
    }
}

extension Domain {
    struct Dependencies {
        let state: AppStateController
        let useCases: UseCases

        static var shared: Dependencies {
            Dependencies(
                state: AppStateController.shared,
                useCases: UseCases.shared
            )
        }
    }
}



