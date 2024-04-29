//
//  NY_City_School_TapTests.swift
//  NY City SchoolsTests
//
//  Created by Aaron L Bratcher on 9/29/23.
//

import XCTest
import ViewInspector
@testable import NY_City_Schools

final class SchoolTapTests: XCTestCase {
	let delegate = SchoolTapTestDelegate()

	func testMapButtonTap() throws {
		let schoolEntry = SchoolEntry(school: School.mockSchools[0],
												delegate: delegate,
												scores: nil) { _ in
		}

		let button = try schoolEntry.inspect().find(viewWithAccessibilityIdentifier: SchoolEntryIdentifier.mapButton.rawValue).button()

		try button.tap()
		XCTAssertTrue(delegate.mapShown)
	}

	func testPhoneButtonTap() throws {
		let schoolEntry = SchoolEntry(school: School.mockSchools[0],
												delegate: delegate,
												scores: nil) { _ in
		}


		let button = try schoolEntry.inspect().find(viewWithAccessibilityIdentifier: SchoolEntryIdentifier.phoneButton.rawValue).button()

		try button.tap()
		XCTAssertTrue(delegate.callMade)
	}

	func testWebsiteButtonTap() throws {
		let schoolEntry = SchoolEntry(school: School.mockSchools[0],
												delegate: delegate,
												scores: nil) { _ in
		}

		let button = try schoolEntry.inspect().find(viewWithAccessibilityIdentifier: SchoolEntryIdentifier.websiteButton.rawValue).button()

		try button.tap()
		XCTAssertTrue(delegate.websiteShown)
	}
}
