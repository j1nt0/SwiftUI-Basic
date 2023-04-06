//
//  How_to_Hide_TabBar_in_NavigationView_When_Using_SwiftUIUITestsLaunchTests.swift
//  How to Hide TabBar in NavigationView When Using SwiftUIUITests
//
//  Created by 이진 on 2023/04/06.
//

import XCTest

final class How_to_Hide_TabBar_in_NavigationView_When_Using_SwiftUIUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
