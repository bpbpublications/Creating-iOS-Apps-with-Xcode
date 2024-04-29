//
//  School.swift
//  NY City Schools
//
//  Created by Aaron Bratcher on 9/17/23.
//

import Foundation

typealias SchoolId = String

struct School: Decodable, Identifiable {
	var id: SchoolId {
		return dbn
	}

	let dbn: SchoolId
	let schoolName: String
	let location: String
	let phoneNumber: String
	let website: String?
	let lat: Double?
	let lon: Double?
}

extension School {
#if DEBUG
static var demoSchools: [School] {
	let s1 = School(dbn: "02M260",
		schoolName: "Clinton School Writers & Artists, M.S. 260",
		location: "10 East 15th Street, Manhattan NY 10003",
		phoneNumber: "212-524-4360",
		website: "www.theclintonschool.net",
		lat: 40.736526,
		lon: -73.992727)

	let s2 = School(dbn: "21K728",
		schoolName: "Liberation Diploma Plus High School",
		location: "2865 West 19th Street, Brooklyn, NY 11224",
		phoneNumber: "718-946-6812",
		website: nil,
		lat: nil,
		lon: nil)

	let s3 = School(dbn: "08X282",
		schoolName: "Women's Academy of Excellence",
		location: "456 White Plains Road, Bronx NY 10473",
		phoneNumber: "718-542-0740",
		website: "schools.nyc.gov/SchoolPortals/08/X282",
		lat: 40.815043,
		lon: -73.85607)

	return [s1, s2, s3]
}
#endif
}
