//
//  AppStateController.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import Foundation
import Combine

class AppStateController {
    static let shared: AppStateController = {
        AppStateController()
    }()

    var queue: DispatchQueue = DispatchQueue(label: "app_state")

    fileprivate var unsafeState: AppState = .init()
    var state: AppState {
        set {
            // perform writes on data synchronously
            queue.sync(flags: .barrier) {
                self.unsafeState = newValue
                self.stateSubject.send(self.unsafeState)
            }
        }

        get {
            unsafeState
        }
    }

    private let stateSubject: CurrentValueSubject<AppState, Never>
    let errorSubject: PassthroughSubject<DomainError, Never>

    private init() {
        stateSubject = .init(unsafeState)
        errorSubject = PassthroughSubject()
    }

    private func statePublisher() -> AnyPublisher<AppState, Never> {
        stateSubject
            .eraseToAnyPublisher()
    }

    func publisher<T: Equatable>(
        for keyPath: KeyPath<AppState, T>,
        distinct: Bool = true
    ) -> AnyPublisher<T, Never> {
        let publisher = statePublisher()
            .map(keyPath)
            .receive(on: DispatchQueue.main)

        if distinct {
            return publisher
                .removeDuplicates()
                .eraseToAnyPublisher()
        }

        return publisher
            .eraseToAnyPublisher()
    }
}
