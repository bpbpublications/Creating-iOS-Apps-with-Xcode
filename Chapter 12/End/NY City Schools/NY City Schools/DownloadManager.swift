//
//  DownloadManager.swift
//  NY City Schools
//
//  Created by Aaron L Bratcher on 10/4/23.
//

import Foundation
import OSLog

enum DownloadError: Error {
	case invalidUrl
	case download
	case parse
}

protocol ProvidesApiInfo {
	var baseUrl: String { get }
	var endPoint: String { get }
	var decoder: JSONDecoder { get }
}

class DownloadManager {
	static let shared = DownloadManager()
	static let subsystem = "Download Manager"
	let executor = Executor()
	let logger = Logger(subsystem: DownloadManager.subsystem, category: "Get")

	private init() {}

	func retrieveData<T: Decodable>(using apiInfo: ProvidesApiInfo) async throws -> T {
		guard let base = URL(string: apiInfo.baseUrl) else {
			throw DownloadError.invalidUrl
		}
		let request = URLRequest(url: base.appendingPathComponent(apiInfo.endPoint))
		let absoluteUrlString = request.url?.absoluteString ?? ""
		logger.info("URL: \(absoluteUrlString)")
		return try await executor.run(request, decoder: apiInfo.decoder)
	}
}

struct Executor {
	func run<DataType: Decodable>(_ request: URLRequest, decoder: JSONDecoder) async throws -> DataType {
		let (data, _) = try await URLSession.shared.data(for: request)

		do {
			return try decoder.decode(DataType.self, from: data)
		} catch {
			throw DownloadError.parse
		}
	}
}
