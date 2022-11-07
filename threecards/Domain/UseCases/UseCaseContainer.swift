//
//  UseCaseContainer.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import Foundation

class UseCaseContainer {
    private var useCaseRegistrations: [String: any UseCase] = [:]

    func register<T: UseCase>(useCase: T.Type, instance: T) {
        useCaseRegistrations[String(describing: useCase)] = instance
    }

    func resolve<T: UseCase>(_ type: T.Type) -> T? {
        return useCaseRegistrations[String(describing: type)] as? T
    }
}
