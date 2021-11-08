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

    override class func setUp() {
        super.setUp()
        Resolver.registerMockServices()
    }

    override func tearDownWithError() throws {
    }

    func test_GetPosts() {
        let sut: PostService = PostService()
        sut.getPosts()
        XCTAssertEqual(sut.postsList.count, 1)
    }
}
