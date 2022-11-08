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
        // Ten days in the future
        let dateNotExpired = Date(fromNowDays: 5)
        XCTAssertTrue(dateNotExpired.expired == false)

        let dateExpired = Date(fromNowDays: -5)
        XCTAssertTrue(dateExpired.expired == true)
    }
}
