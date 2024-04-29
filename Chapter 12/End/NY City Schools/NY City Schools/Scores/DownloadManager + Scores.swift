//
//  DownloadManager + Scores.swift
//  NY City Schools
//
//  Created by Aaron L Bratcher on 10/4/23.
//

import Foundation
import OSLog

extension DownloadManager {
	typealias ScoreDownloadResults = Result<[Scores], DownloadError>
	func downloadScores() async -> ScoreDownloadResults {
		let logger = Logger(subsystem: DownloadManager.subsystem, category: "Scores")
		do {
			let scores: [Scores] = try await retrieveData(using: ScoreCardApiData())
			logger.info("scores downloaded")
			return .success(scores)
		} catch DownloadError.invalidUrl {
			logger.error("Invalid URL")
			return .failure(.invalidUrl)
		} catch DownloadError.parse {
			logger.error("Error parsing")
			return .failure(.parse)
		} catch {
			logger.error("Cannot download")
			return .failure(.download)
		}
	}
}

struct ScoreCardApiData: ProvidesApiInfo {
	var baseUrl: String { "https://data.cityofnewyork.us/resource/" }
	var endPoint: String { "f9bf-2cp4.json" }
	var decoder: JSONDecoder { JSONDecoder() }
}
