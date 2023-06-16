//
//  userProfileTests.swift
//  Lab-fakeMockStubTests
//
//  Created by Mohanad Abbood on 6/16/23.
//
import Foundation
import XCTest
@testable import Lab_fakeMockStub

 class userProfileTests: XCTestCase {

    // fake test
    func testFake() {
        let fake = UserProfileServiceFake()
        let expectedProfile = UserProfile(userId: "1", name: "Test", email: "test@example.com")
        fake.users["1"] = expectedProfile

        let expectation = self.expectation(description: "Fetch Profile")
        
        fake.fetchProfile(userId: "1") { profile, error in
            XCTAssertNil(error)
            XCTAssertEqual(profile, expectedProfile)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    
    // mock test
    func testMock() {
        let mock = UserProfileServiceMock()
        
        mock.fetchProfile(userId: "1") { _, _ in }
        
        XCTAssertTrue(mock.fetchProfileCalled)
        XCTAssertEqual(mock.lastUserId, "1")
    }

    
    // stub test
    func testStub() {
        let stub = UserProfileServiceStub()
        let expectedProfile = UserProfile(userId: "1", name: "Test", email: "test@example.com")
        stub.profile = expectedProfile

        let expectation = self.expectation(description: "Fetch Profile")
        
        stub.fetchProfile(userId: "1") { profile, error in
            XCTAssertNil(error)
            XCTAssertEqual(profile, expectedProfile)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

}
