//
//  AlertOverlayManager.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import Foundation
import Combine

class AlertOverlayManager: ObservableObject {

    // Pass a binding to an alert state that can be changed at
    // any time.
    @Published var currentAlertState: AlertState? = nil
    @Published var showAlert: Bool = false

    @Published private var alertStack = [AlertState]()
    private var cancellables = Set<AnyCancellable>()

    init(alertState: AnyPublisher<AlertState, Never>) {
        alertState
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] alertState in
                self?.alertStack.append(alertState)
                self?.currentAlertState = alertState
                self?.showAlert = true
            })
            .store(in: &cancellables)
    }

    @MainActor
    func dismiss() {
        showAlert = false
        guard alertStack.popLast() != nil,
            let nextAlertState = alertStack.last else {
            return
        }

        Task {
            currentAlertState = nextAlertState
            showAlert = true
        }
    }
}
