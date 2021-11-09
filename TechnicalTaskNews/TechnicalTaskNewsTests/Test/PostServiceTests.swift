//
//  TechnicalTaskNewsTests.swift
//  TechnicalTaskNewsTests
//
//  Created by Jose Moffa on 11/5/21.
//

import XCTest
import Resolver
@testable import TechnicalTaskNews

class PostServiceTests: XCTestCase {

    @LazyInjected var postDataSource: MockDataSource

    override class func setUp() {
        super.setUp()
        Resolver.registerMockServices()
    }

    override func tearDownWithError() throws {
    }
}

// MARK: - Unit tests
extension PostServiceTests {
    func testGetPost() {
        let sut: PostService = PostService()
        postDataSource.results = [mockPost()]

        sut.getPosts()
        XCTAssertEqual(sut.postsList.count, 1)
        XCTAssertEqual(sut.postsList.first, mockPost())
    }

    func testDeletePost() {
        let sut: PostService = PostService()
        sut.postsList = [mockPost()]

        sut.deletePost(post: mockPost())
        XCTAssertEqual(sut.postsList.count, 0)
    }
}

// MARK: - Helper functions
extension PostServiceTests {
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
