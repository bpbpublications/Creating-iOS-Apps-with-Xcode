//
//  SchoolTapTestDelegate.swift
//  NY City SchoolsTests
//
//  Created by Aaron L Bratcher on 9/24/23.
//

import Foundation
@testable import NY_City_Schools

class SchoolTapTestDelegate: HandlesSchoolButtons {
	var mapShown = false
	var callMade = false
	var websiteShown = false

	func showMap(for school: School) {
		mapShown = true
	}
	
	func call(_ school: School) {
		callMade = true
	}
	
	func showWebsite(for school: School) {
		websiteShown = true
	}
}
