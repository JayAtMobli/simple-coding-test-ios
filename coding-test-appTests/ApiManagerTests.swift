//
//  ApiManagerTests.swift
//  coding-test-appTests
//
//  Created by Jay Park on 7/07/23.
//

import XCTest
@testable import coding_test_app

final class ApiManagerTests: XCTestCase {
    let apiManager = ApiManager()
    let url = URL(string: "http://wwww.google.com")!

    func testPerformRequest_200() async {
        let response200 = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "", headerFields: nil)!
        let result = apiManager.handleResponse(data: Data(), response: response200)
        switch result {
        case .success:
            print("Success")
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }
}
