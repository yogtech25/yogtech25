//  Created by rails on 18/08/21.
//

import Foundation
import XCTest
@testable import iOSCaseStudy

class CellITuneSearchListTests: XCTestCase {
    
    var cell: CellITuneSearchList!
    var nameLabel = UILabel()
    var image = UIImageView()
    
    override func setUpWithError() throws {
        cell = CellITuneSearchList()
        cell.nameLabel = nameLabel
        cell.thumbnailImage = image
        image.frame = cell.thumbnailImage.frame
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
    
    func test_nameLabel() {
        cell.setUpData(model: WebData(trackId: 454545, trackName: "New Songs", artistName: "Donald", artworkUrl60: SDConstant().staticImageUrl))
        XCTAssert(cell.nameLabel.text! == "New Songs", "")
    }
}
