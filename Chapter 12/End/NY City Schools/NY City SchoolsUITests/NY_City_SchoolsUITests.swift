//
//  NY_City_SchoolsUITests.swift
//  NY City SchoolsUITests
//
//  Created by Aaron L Bratcher on 9/17/23.
//

import XCTest

final class NY_City_SchoolsUITests: XCTestCase {
	func testShowScores() throws {
		let app = XCUIApplication()
		app.launchArguments = ["-testMode", "YES"]
		app.launch()
		let scoresButton = app
			.scrollViews
			.otherElements
			.containing(.staticText, identifier:"Clinton School Writers & Artists, M.S. 260")
			.children(matching: .button)
			.matching(identifier: SchoolEntryIdentifier.scoresButton.rawValue)
			.element(boundBy: 0)

		scoresButton.tap()
		let schoolName = app.staticTexts[ScoreCardIdentifier.schoolName.rawValue]
		XCTAssertTrue(schoolName.exists)
	}
}
