//
//  NY_City_SchoolsUITests.swift
//  NY City SchoolsUITests
//
//  Created by Aaron Bratcher on 9/17/23.
//

import XCTest
@testable import NY_City_Schools

final class NY_City_SchoolsUITests: XCTestCase {
	func testShowScores() throws {
		let app = XCUIApplication()
		app.launch()
		let scoresButton = app
			.scrollViews
			.otherElements
			.containing(.staticText, identifier:"Clinton School Writers & Artists, M.S. 260")
			.children(matching: .button)
			.matching(identifier: "scoresButton")
			.element(boundBy: 0)

		scoresButton.tap()
		let schoolName = app.staticTexts["schoolName"]
		XCTAssertTrue(schoolName.exists)
	}
}
