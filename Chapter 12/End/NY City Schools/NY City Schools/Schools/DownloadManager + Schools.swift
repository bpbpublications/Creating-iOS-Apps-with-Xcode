//
//  NetworkManager + Schools.swift
//  NY City Schools
//
//  Created by Aaron L Bratcher on 10/4/23.
//

import Foundation
import OSLog

extension DownloadManager {
	typealias SchoolDownloadResults = Result<[School], DownloadError>
	func downloadSchools() async -> SchoolDownloadResults {
		let logger = Logger(subsystem: DownloadManager.subsystem, category: "Schools")
		do {
			let schools: [School] = try await retrieveData(using: SchoolApiData())
			logger.info("schools downloaded")
			return .success(schools)
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

struct SchoolApiData: ProvidesApiInfo {
	var baseUrl: String { "https://data.cityofnewyork.us/resource/" }
	var endPoint: String { "s3k6-pzi2.json" }
	var decoder: JSONDecoder { JSONDecoder() }
}
