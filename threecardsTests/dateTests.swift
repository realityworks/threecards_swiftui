//
//  dateDisplayTests.swift
//  threecardsTests
//
//  Created by Piotr Suwara on 8/11/2022.
//

import XCTest

final class dateTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExpiry() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        // Ten days in the future
        let dateNotExpired = Date(fromNowDays: 5)
        XCTAssertTrue(dateNotExpired.expired == false)

        let dateExpired = Date(fromNowDays: -5)
        XCTAssertTrue(dateExpired.expired == true)
    }
}