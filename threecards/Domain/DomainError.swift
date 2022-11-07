//
//  DomainError.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import Foundation

// Any error mapped by the domain that has been generated and
// will be passed through the error management funnel.
// TODO: We need to add support for actions here.

struct DomainErrorAction {

    static let ok = Self.init(handlerType: .ok)
    static let `continue` = Self.init(handlerType: .continue)

    typealias Handler = ()->()

    enum HandlerType {
        case ok
        case `continue`
        case cancel
        case custom(text: String)

        var title: String {
            switch self {
            case .ok:
                return "Ok"
            case .continue:
                return "Continue"
            case .cancel:
                return "Cancel"
            case let .custom(text):
                return text
            }
        }

    }

    let handlerType: HandlerType
    let handler: Handler?

    init(handlerType: HandlerType, handler: Handler? = nil) {
        self.handlerType = handlerType
        self.handler = handler
    }
}

struct DomainError: LocalizedError {
    let originalError: Error
    let dateTime: Date

    let primaryAction: DomainErrorAction
    let secondaryAction: DomainErrorAction?

    init(with error: Error, dateTime: Date = .now) {
        self.originalError = error
        self.dateTime = dateTime
        self.primaryAction = .ok
        self.secondaryAction = nil
    }

    static func unknown(_ error: Error) -> DomainError {
        DomainError(with: error)
    }

    var errorDescription: String? {
        switch originalError {
        case let error as LocalizedError:
            return error.errorDescription
        default:
            return originalError.localizedDescription
        }

    }
}
