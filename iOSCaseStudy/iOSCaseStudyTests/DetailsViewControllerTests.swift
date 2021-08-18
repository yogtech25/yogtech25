//
//  DetailsViewControllerTests.swift
//  iTunesSearchTests
//
//  Created by rails on 18/08/21.
//

import Foundation
import XCTest
@testable import iOSCaseStudy

class DetailsViewControllerTests: XCTestCase {
    var vc: DetailViewController!
    
    override func setUpWithError() throws {
        vc = DetailViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAddDeletedObjectInUserDefault() {
        let trackId = 00110011
        vc.addDeletedObjectInUserDefault(webObjectId: trackId)
        let deletedList = UserDefaults.standard.value(forKey: "deleteObject") as? [Int]
        let isContaints = deletedList?.contains(trackId) ?? false
        XCTAssert(isContaints == true, "Deleted website is not removing from the list")
    }

    func testAddWebsiteInVisitedList() {
        let trackId = 00110011
        vc.addWebsiteInVisitedList(trackId: trackId)
        let visitedList = UserDefaults.standard.value(forKey: "visitedWeb") as? [Int]
        let isContaints = visitedList?.contains(trackId) ?? false
        XCTAssert(isContaints == true, "Visites website is not updating in list")
    }
}
