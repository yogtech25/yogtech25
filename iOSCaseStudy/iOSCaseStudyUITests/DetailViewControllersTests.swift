
//  Created by rails on 18/08/21.
//

import XCTest

class DetailViewControllersTests: XCTestCase {

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

    func testCellSelection() throws {
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        let firstCell = tablesQuery.cells.element(boundBy: 0)
        firstCell.tap()
    }
    
    func testDeleteAlertPopup () throws {
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        let firstCell = tablesQuery.cells.element(boundBy: 0)
        firstCell.tap()
        let deleteStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Delete"]/*[[".buttons[\"Delete\"].staticTexts[\"Delete\"]",".staticTexts[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteStaticText.tap()
    }
    
    func testDeleteAlertPopupCancelButton () throws {
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        let firstCell = tablesQuery.cells.element(boundBy: 0)
        firstCell.tap()
        let deleteStaticText = app.staticTexts["Delete"]
        deleteStaticText.tap()
        let cancelButton = app.alerts["Delete"].scrollViews.otherElements.buttons["Cancel"]
        cancelButton.tap()
    }
    
    func testDeleteAlertPopupOkButton () throws {
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        let firstCell = tablesQuery.cells.element(boundBy: 0)
        firstCell.tap()
        let deleteStaticText = app.staticTexts["Delete"]
        deleteStaticText.tap()
        let cancelButton = app.alerts["Delete"].scrollViews.otherElements.buttons["Ok"]
        cancelButton.tap()
    }
    
    func testBackButton () throws {
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        let firstCell = tablesQuery.cells.element(boundBy: 0)
        firstCell.tap()
        app.buttons["arrowshape.turn.up.backward"].tap()
    }
    
}
