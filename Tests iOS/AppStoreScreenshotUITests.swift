import XCTest

final class AppStoreScreenshotUITests: XCTestCase {

    private var app: XCUIApplication!
     
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        // Example of passing in launch arguments which can be read in the app
        // by calling CommandLine.arguments.contains("--uitesting")
        // app.launchArguments.append("--uitesting")
        setupSnapshot(app)
        app.launch()
    }
 
    override func tearDownWithError() throws {
        app = nil
    }
 
    func testScreenshot1() throws {
        sleep(20)
       
        snapshot("Standings View")
    }
}
