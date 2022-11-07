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
    typealias StateAccess = WritableKeyPath<GlobalState, State>
    
    var stateController: GlobalStateController { get }
    var lens: StateAccess { get }
    var state: State { get set }
}

extension UseCase {
    var description: String {
        "\(String(describing: type(of: self))): This use case does not have a description..."
    }
}

extension UseCase {
    var hasCurrentUser: Bool {
        globalState.userAccount.currentUserId != nil
    }

    var currentUserId: UserId {
        get throws {
            guard let userId = globalState.userAccount.currentUserId else {
                throw "Current user does not exist!"
            }

            return userId
        }
    }

    var hasCurrentDevice: Bool {
        globalState.intelliIQ.currentlySelectedDevice?.intelliIQ.id != nil
    }

    var currentDeviceId: IntelliIQDevice.ID {
        get throws {
            guard let deviceId = globalState.intelliIQ.currentlySelectedDevice?.intelliIQ.id else {
                throw "Current Device does not exist!"
            }
            
            return deviceId
        }
    }

    var stateController: GlobalStateController {
        get {
            GlobalStateController.shared
        }
    }

    var globalState: GlobalState {
        set {
            stateController.state = newValue
        }

        get {
            stateController.state
        }
    }

    var state: State {
        get {
            globalState[keyPath: lens]
        } set {
            globalState[keyPath: lens] = newValue
        }
    }

    @discardableResult
    func internalError(with error: Error) -> Bool {
        Logger.error(topic: .appState, message: "Internal Error: \(error.localizedDescription)")
        
        guard let domainError = error as? DomainError else {
            stateController.errorSubject.send(.unknown(error))
            return false
        }

        stateController.errorSubject.send(domainError)
        return true
    }
}
