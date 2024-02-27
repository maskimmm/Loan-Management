//
//  APIServiceTests.swift
//  Loan ManagementTests
//
//  Created by Rifqi Alhakim Hariyantoputera on 27/02/24.
//

import XCTest
@testable import Loan_Management

final class APIServiceTests: XCTestCase {
    func testFetchAPI() {
        let apiService = APIService.shared
        let expectation = self.expectation(description: "Data is fetched")
        
        apiService.getLoanDatas { results in
            switch results {
            case .success(let success):
                XCTAssertNotNil(success, "Data should not nil")
                expectation.fulfill()
            case .failure(let failure):
                XCTFail("Fetch data is failed with error: \(failure)")
            }
        }
        
        waitForExpectations(timeout: 5)
    }
    
    func testIsAPIContainData() {
        let apiService = APIService.shared
        let expectation = self.expectation(description: "Data contains")
        
        apiService.getLoanDatas { results in
            switch results {
            case .success(let success):
                XCTAssertEqual(success.contains(where: {$0.id == "658539b43f5498ccae79105b"}), true)
                expectation.fulfill()
            case .failure(let failure):
                XCTFail("Fetch data is failed with error: \(failure)")
            }
        }
        
        waitForExpectations(timeout: 5)
        
    }
}
