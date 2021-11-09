//
//  MockDataSource.swift
//  TechnicalTaskNewsTests
//
//  Created by Jose Moffa on 11/8/21.
//

import Foundation
@testable import TechnicalTaskNews

class MockDataSource: PostDataSource {

    var results: [DomainPost]?

    func list(completionHandler: @escaping ([DomainPost]?, Error?) -> Void) {
        guard let results = results else {
          fatalError("Result is nil")
        }

        completionHandler(results, nil)
    }

    func delete(_ item: DomainPost, completionHandler: @escaping (Error?) -> Void) {
        completionHandler(nil)
    }
}
