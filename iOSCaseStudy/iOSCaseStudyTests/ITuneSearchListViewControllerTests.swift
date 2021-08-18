//
//  ITuneSearchListViewControllerTests.swift
//  iTunesSearchTests
//
//  Created by rails on 18/08/21.
//

import Foundation
import XCTest
@testable import iOSCaseStudy

class ITuneSearchListViewControllerTests: XCTestCase {
    var vc: ITuneSearchListViewController!
    var tableView = UITableView()
    
    override func setUpWithError() throws {
        vc = ITuneSearchListViewController()
        vc.tableView = tableView
        vc.webListData? = [WebData(trackId: 454545, trackName: "New Songs", artistName: "Donald", artworkUrl60: "")]
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
    
    func testTableViewOutlet() {
        XCTAssertNotNil(vc.tableView)
    }
    
    func test_whenRegisteredCellInTableview() {
        vc.tableView.register(UINib(nibName: SDConstant().cellITuneSearchList, bundle: nil), forCellReuseIdentifier: SDConstant().cellITuneSearchList)
        vc.tableView.reloadData()
    }
    
    func test_addObjectInWebArray() {
        vc.tableView.register(UINib(nibName: SDConstant().cellITuneSearchList, bundle: nil), forCellReuseIdentifier: SDConstant().cellITuneSearchList)
        vc.webListData?.append(WebData(trackId: 454545, trackName: "New Songs", artistName: "Donald", artworkUrl60: ""))
        vc.tableView.reloadData()
    }
}

