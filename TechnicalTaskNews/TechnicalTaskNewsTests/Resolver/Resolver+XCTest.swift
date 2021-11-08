//
//  Resolver+XCTest.swift
//  TechnicalTaskNewsTests
//
//  Created by Jose Moffa on 11/7/21.
//

import Foundation
import Resolver
@testable import TechnicalTaskNews

extension Resolver {
    // MARK: - Mock Container
    static var mock = Resolver(child: .main)

    // MARK: - Register Mock Services
    static func registerMockServices() {
        root = Resolver.mock
        defaultScope = .application
        Resolver.mock.register { MockDataSource() }.implements(PostDataSource.self)
    }
}
