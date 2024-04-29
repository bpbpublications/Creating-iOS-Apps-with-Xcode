//
//  Scores.swift
//  NY City Schools
//
//  Created by Aaron L Bratcher on 9/17/23.
//

import Foundation

struct Scores: Decodable, Identifiable {
	var id: SchoolId {
		dbn
	}
	
	let dbn: String
	let schoolName: String
	let numTakers: String?
	let readingAvgScore: String?
	let mathAvgScore: String?
	let writingAvgScore: String?
}

extension Scores {
	enum CodingKeys: String, CodingKey {
		case dbn
		case schoolName = "school_name"
		case numTakers = "num_of_sat_test_takers"
		case readingAvgScore = "sat_critical_reading_avg_score"
		case mathAvgScore = "sat_math_avg_score"
		case writingAvgScore = "sat_writing_avg_score"
	}
}

#if DEBUG
extension Scores {
	static var mockScoreDictionary: [SchoolId: Scores] {
		var scoreDict: [SchoolId: Scores] = [:]

		for scores in mockScores {
			scoreDict[scores.dbn] = scores
		}

		return scoreDict
	}

	static var mockScores: [Scores] {
		let s1 = Scores(dbn: "02M260",
							 schoolName: "Clinton School Writers & Artists, M.S. 260",
							 numTakers: "120",
							 readingAvgScore: "355",
							 mathAvgScore: "404",
							 writingAvgScore: "363")

		let s2 = Scores(dbn: "21K728",
							 schoolName: "Liberation Diploma Plus High School",
							 numTakers: "50",
							 readingAvgScore: nil,
							 mathAvgScore: "375",
							 writingAvgScore: nil)

		let s3 = Scores(dbn: "08X282",
							 schoolName: "Women's Academy of Excellence",
							 numTakers: "84",
							 readingAvgScore: "380",
							 mathAvgScore: nil,
							 writingAvgScore: "372")

		return [s1, s2, s3]
	}
}
#endif
