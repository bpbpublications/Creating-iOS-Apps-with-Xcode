//
//  NY_City_SchoolsTests.swift
//  NY City SchoolsTests
//
//  Created by Aaron L Bratcher on 9/17/23.
//

import XCTest
@testable import NY_City_Schools

final class ModelTests: XCTestCase {
	func testSchoolModel() throws {
		guard let file = Bundle(for: type(of: self)).url(forResource: "Schools", withExtension: "json") else {
			XCTFail("Cannot read json file")
			return
		}

		let data = try Data(contentsOf: file)
		let decoder = JSONDecoder()
		let schools = try decoder.decode([School].self, from: data)
		XCTAssertEqual(schools.count, 6)

		let firstSchool = try XCTUnwrap(schools.first)
		XCTAssertNotNil(firstSchool.lat)
		XCTAssertNotNil(firstSchool.lon)
	}

	func testScoresModel() throws {
		guard let file = Bundle(for: type(of: self)).url(forResource: "Scores", withExtension: "json") else {
			XCTFail("Cannot read json file")
			return
		}

		let data = try Data(contentsOf: file)
		let decoder = JSONDecoder()
		let scores = try decoder.decode([Scores].self, from: data)
		XCTAssertEqual(scores.count, 5)

		let firstScore = try XCTUnwrap(scores.first)
		XCTAssertEqual(firstScore.numTakers, "29")
	}
}
