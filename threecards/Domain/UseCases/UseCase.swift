//
//  threecardsApp.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//


import Foundation

// A use case requires it to have access to a global state controller...
protocol UseCase: AnyObject, CustomStringConvertible, DependencyEnvironment {
    associatedtype State: UseCaseState
    typealias StateAccess = WritableKeyPath<AppState, State>
    
    var stateController: AppStateController { get }
    var lens: StateAccess { get }
    var state: State { get set }
}

extension UseCase {
    var description: String {
        "\(String(describing: type(of: self))): This use case does not have a description..."
    }
}

extension UseCase {
    var stateController: AppStateController {
        get {
            AppStateController.shared
        }
    }

    var appState: AppState {
        set {
            stateController.state = newValue
        }

        get {
            stateController.state
        }
    }

    var state: State {
        get {
            appState[keyPath: lens]
        } set {
            appState[keyPath: lens] = newValue
        }
    }

    @discardableResult
    func internalError(with error: Error) -> Bool {
        print("Internal Error: \(error.localizedDescription)")
        
        guard let domainError = error as? DomainError else {
            stateController.errorSubject.send(.unknown(error))
            return false
        }

        stateController.errorSubject.send(domainError)
        return true
    }
}
