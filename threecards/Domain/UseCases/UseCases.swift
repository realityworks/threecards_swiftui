//
//  threecardsApp.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import Foundation

class UseCases {

    private let useCaseContainer = UseCaseContainer()
    init() {
        // Initialise with live for main use environment
    }

    func useMock() {
        registerUseCase(instance: UserAccountUseCase(dependencies: .mock))
    }

    func useLive() {
        registerUseCase(instance: UserAccountUseCase(dependencies: .live))
    }

    func registerUseCase<T: UseCase>(instance: T) {
        let type = type(of: instance)
        useCaseContainer.register(useCase: type, instance: instance)
    }

    func useCase<T: UseCase>(_ type: T.Type) throws -> T {
        guard let useCase = useCaseContainer.resolve(type) else {
            throw "UseCase does not exist!"
        }

        return useCase
    }
}

extension UseCases {
    static var shared: UseCases = {
        let useCases = UseCases()
        useCases.useMock()

        return useCases
    }()
}
