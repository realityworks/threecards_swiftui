//
//  SafePublisher.swift
//  threecards
//
//  Created by Piotr Suwara on 8/11/2022.
//

import Combine

// Type helpers to reduce verbose any publisher definitions

typealias SafePublisher<T> = AnyPublisher<T, Never>

// Value type support for publishers

protocol SafePublishing {
    associatedtype SafePublisherType
}

extension SafePublishing {
    typealias SafePublisherType = SafePublisher<Self>
    typealias OptionalSafePublisherType = SafePublisher<Self?>
}
