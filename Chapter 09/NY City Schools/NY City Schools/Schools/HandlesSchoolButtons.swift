//
//  SchoolListActions.swift
//  NY City Schools
//
//  Created by Aaron Bratcher on 9/19/23.
//

import Foundation

protocol HandlesSchoolButtons {
	func showMap(for school: School)
	func call(_ school: School)
	func showWebsite(for school: School)
}
