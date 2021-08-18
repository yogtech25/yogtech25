
//  Created by rails on 18/08/21.
//

import XCTest

class ITuneSearchListViewControllerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testCellExistance() throws {
        let app = XCUIApplication()
        app.launch()
        sleep(1)
        let firstCell = app.tables.cells.element(boundBy: 0)
        XCTAssert(firstCell.exists == true, "Tableview cell not exist in cell")
    }
    
    func testSelection() throws {
        let app = XCUIApplication()
        app.launch()
        sleep(1)
        let firstCell = app.tables.cells.element(boundBy: 0)
        firstCell.tap()
    }
    
    func testTableScrolling() throws {
        let app = XCUIApplication()
        app.launch()
        sleep(1)
        let tablesQuery = app.tables
        tablesQuery.cells.element(boundBy: 8).swipeUp()
    }
}
