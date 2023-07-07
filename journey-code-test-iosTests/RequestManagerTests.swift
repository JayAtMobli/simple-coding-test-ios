//
//  RequestManagerTests.swift
//  journey-code-test-iosTests
//
//  Created by Jay Park on 7/07/23.
//

import XCTest
@testable import journey_code_test_ios

final class RequestManagerTests: XCTestCase {
    private var requestManager: (any RequestManagerProtocol)? = nil
    
    override func setUpWithError() throws {
        let dataParser = DataParser()
        let apiManager = MockApiManager()
        
        requestManager = RequestManager(
            apiManager: apiManager,
            parser: dataParser
        )
    }
    
    func testGetPosts() async throws {
        let request = MockPostRequest()
        guard let result: Result<[Post], Error> = await requestManager?.perform(request) else {
            XCTFail("Didn't get data from the request manager")
            return
        }
        
        switch result {
        case .success(let posts):
            XCTAssertEqual(posts.count, 100)
        case .failure(let error):
            XCTFail("Didn't get data from the request manager \(error))")
        }
    }
    
    func testGetComments() async throws {
        let request = MockCommentsRequest()
        guard let result: Result<[Comment], Error> = await requestManager?.perform(request) else {
            XCTFail("Didn't get data from the request manager")
            return
        }
        
        switch result {
        case .success(let comments):
            XCTAssertEqual(comments.count, 5)
        case .failure(let error):
            XCTFail("Didn't get data from the request manager \(error))")
        }
    }
}
