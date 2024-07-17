//
//  AstronomyPictureTests.swift
//  AstronomyPictureTests
//
//  Created by Ummer on 17/07/24.
//

import XCTest
@testable import AstronomyPicture

final class AstronomyPictureTests: XCTestCase {
    var apiClient: AstronomyPictureAPIClient!

    override func setUpWithError() throws {
        // Using mock networking service for testing
        let mockNetworkingService = MockNetworkingService()
        apiClient = AstronomyPictureAPIClient(networkingService: mockNetworkingService)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiClient = nil
    }

    func testFetchAstronomyPictures() throws {
        let expectation = self.expectation(description: "Fetch astronomy pictures")
        apiClient.getAstronomyPictures { result in
            switch result {
            case .success(let pictures):
                XCTAssertEqual(pictures[0].title, "Zeta Oph: Runaway Star")
                XCTAssertEqual(pictures[0].date, "2024-01-04")
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4.0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
