//
//  School.swift
//  NY City Schools
//
//  Created by Aaron L Bratcher on 9/17/23.
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
	enum CodingKeys: String, CodingKey {
		case dbn
		case schoolName = "school_name"
		case location
		case phoneNumber = "phone_number"
		case website
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		dbn = try container.decode(String.self, forKey: .dbn)
		schoolName = try container.decode(String.self, forKey: .schoolName)

		let location = try container.decode(String.self, forKey: .location)

		// extract Lat and Lon
		let regex = "\\((.*?)\\)"
		var lat: Double?
		var lon: Double?

		if let latLonRange = location.range(of: regex, options: .regularExpression) {
			let latLon = String(location[latLonRange]).replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: " ", with: "")

			let values = latLon.split(separator: ",")
			if values.count == 2 {
				lat = Double(values[0])
				lon = Double(values[1])
			}
		}

		self.lat = lat
		self.lon = lon

		self.location = location.stripParentheticalText()
		self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)

		let website = try container.decodeIfPresent(String.self, forKey: .website)
		if var website = website {
			if !website.starts(with: "https://") && !website.starts(with: "http://") {
				website = "https://\(website)"
			}
			self.website = website
		} else {
			self.website = nil
		}
	}
}

#if DEBUG
extension School {
	static var mockSchools: [School] {
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
}
#endif
