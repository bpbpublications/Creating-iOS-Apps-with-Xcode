//
//  SchoolListViewModel.swift
//  NY City Schools
//
//  Created by Aaron L Bratcher on 9/18/23.
//

import Foundation
import Observation
import MapKit
import OSLog

enum LoadingStatus {
	 case loading
	 case complete
	 case error
}

@Observable
class SchoolListViewModel {
	private(set) var schools: [School] = []
	private(set) var scores: [SchoolId: Scores] = [:]
	private(set) var loadingStatus: LoadingStatus = .loading
	var searchText: String = "" {
		didSet {
			if self.searchText.count < 2 {
				self.schools = self.allSchools
				return
			}

			DispatchQueue.main.async {
				self.schools = self.allSchools.filter({ $0.schoolName.contains(self.searchText) || $0.location.contains(self.searchText) })
			}
		}
	}

	private var allSchools: [School] = []
	private let logger = Logger(subsystem: "Schools App", category: "School")
	private let downloadManager: DownloadManager

	init(downloadManager: DownloadManager = DownloadManager.shared) {
		self.downloadManager = downloadManager
	}

	@MainActor
	func downloadData() async {
		#if DEBUG
		if UIApplication.isRunningTest {
			logger.info("TESTING — USING MOCK DATA")
			self.schools = School.mockSchools
			self.scores = Scores.mockScoreDictionary
			self.loadingStatus = .complete
			return
		}
		#endif

		let schoolResults = await downloadManager.downloadSchools()

		var downloadedSchools: [School] = []
		var downloadedScores: [SchoolId: Scores] = [:]
		var loadingStatus: LoadingStatus = .loading

		switch schoolResults {
		case .success(let schools):
			downloadedSchools = schools
			loadingStatus = .complete
		case .failure(_):
			loadingStatus = .error
		}

		let scoreResults = await downloadManager.downloadScores()
		if case let .success(scores) = scoreResults {
			downloadedScores = convertScoresToDict(scores)
		}

		self.allSchools = downloadedSchools
		self.schools = downloadedSchools
		self.scores = downloadedScores
		self.loadingStatus = loadingStatus
	}

	private func convertScoresToDict(_ scores: [Scores]) -> [String: Scores] {
		let scoresDict = scores.reduce(into: [String: Scores]()) {
			$0[$1.dbn] = $1
		}

		return scoresDict
	}

	func scores(for school: School) -> Scores? {
		scores[school.id]
	}
}

extension SchoolListViewModel: HandlesSchoolButtons {
	func showMap(for school: School) {
		logger.info("Attempting to show \(school.schoolName) on map")
		guard let lat = school.lat, let lon = school.lon else {
			logger.error("No geoposition available for \(school.schoolName)")
			return
		}

		let regionDistance:CLLocationDistance = 10_000
		let coordinates = CLLocationCoordinate2DMake(lat, lon)
		let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
		let options = [
			 MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
			 MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
		]
		let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
		let mapItem = MKMapItem(placemark: placemark)
		mapItem.name = school.schoolName
		mapItem.openInMaps(launchOptions: options)
		logger.notice("\(school.schoolName) shown on map")
	}
	
	func call(_ school: School) {
		logger.info("Attempting to call \(school.schoolName)")
		guard let url = URL(string: "tel://\(school.phoneNumber)"), UIApplication.shared.canOpenURL(url) else {
			logger.error("Cannot call \(school.schoolName)")
			return
		}
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
		logger.notice("Call initiated to \(school.schoolName)")
	}
	
	func showWebsite(for school: School) {
		logger.info("Attempting to show website for \(school.schoolName)")
		guard var ws = school.website else { return }
		if !ws.starts(with: "http") {
			logger.notice("Adding https prefix")
			ws = "https://" + ws
		}

		guard let url = URL(string: ws), UIApplication.shared.canOpenURL(url) else {
			logger.error("Could not open URL")
			return
		}

		UIApplication.shared.open(url, options: [:], completionHandler: nil)
		logger.notice("Website for \(school.schoolName) was opened")
	}
}
