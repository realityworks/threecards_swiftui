//
//  DependencyConformance.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import Foundation

protocol DependencyEnvironment {
    associatedtype DI: DependencyConformance

    init(dependencies: DI)
}

protocol DependencyConformance {
    static var live: Self { get }
    static var mock: Self { get }
}
