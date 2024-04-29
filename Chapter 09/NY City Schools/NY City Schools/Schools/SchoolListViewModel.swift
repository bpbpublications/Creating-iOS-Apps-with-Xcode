//
//  SchoolListViewModel.swift
//  NY City Schools
//
//  Created by Aaron Bratcher on 9/18/23.
//

import Foundation
import Observation
import MapKit

@Observable
class SchoolListViewModel {
	var schools: [School] = School.demoSchools
	var scores: [SchoolId: Scores] = Scores.mockScoreDictionary
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

	private var allSchools = School.demoSchools

	func scores(for school: School) -> Scores? {
		scores[school.id]
	}
}

extension SchoolListViewModel: HandlesSchoolButtons {
	func showMap(for school: School) {
		guard let lat = school.lat, let lon = school.lon else { return }

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
	}
	
	func call(_ school: School) {
		guard let url = URL(string: "tel://\(school.phoneNumber)"), UIApplication.shared.canOpenURL(url) else { return }
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}
	
	func showWebsite(for school: School) {
		guard var ws = school.website else { return }
		if !ws.starts(with: "http") {
			ws = "https://" + ws
		}

		guard let url = URL(string: ws), UIApplication.shared.canOpenURL(url) else { return }

		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}
}
