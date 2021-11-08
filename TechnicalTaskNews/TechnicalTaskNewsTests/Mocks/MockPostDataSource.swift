//
//  MockDataSource.swift
//  TechnicalTaskNewsTests
//
//  Created by Jose Moffa on 11/8/21.
//

import Foundation
@testable import TechnicalTaskNews

class MockDataSource: PostDataSource {

    func list(completionHandler: @escaping ([DomainPost]?, Error?) -> Void) {
        let posts = [mockPost()]
        completionHandler(posts, nil)
    }

    func delete(_ item: DomainPost, completionHandler: @escaping (Error?) -> Void) {

    }

    private func mockPost() -> DomainPost {
        return DomainPost(
            id: "123456789",
            storyTitle: "New post",
            title: nil,
            author: "Jose Moffa",
            url: "https://google.com",
            createdAtI: Int(Date.now.timeIntervalSince1970))
    }
}
