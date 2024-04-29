//
//  ContentView.swift
//  NY City Schools
//
//  Created by Aaron L Bratcher on 9/17/23.
//

import SwiftUI
import CommonUI

struct SchoolEntry: View {
	let school: School
	let delegate: HandlesSchoolButtons
	let scores: Scores?
	let showCard: (Scores) -> Void

	var body: some View {
		Card {
			VStack {
				HStack {
				VStack(alignment: .leading) {
						Text(school.schoolName)
							.style(.h2)
						Text(school.location)
							.style(.paragraph)
						Text(school.phoneNumber)
							.style(.paragraph)
					}
					Spacer()
					VStack {
						if school.lat != nil && school.lon != nil {
							Button(action: {
								delegate.showMap(for: school)
							}, label: {
								Image(systemName: "mappin.circle")
									.resizable()
									.frame(width: 35, height: 35)
									.foregroundColor(.blue)
									.padding(.bottom, 8)
							})
							.accessibility(identifier: SchoolEntryIdentifier.mapButton.rawValue)
						}

						Button(action: {
							delegate.call(school)
						}, label: {
							Image(systemName: "phone.circle")
								.resizable()
								.frame(width: 35, height: 35)
								.foregroundColor(.blue)
						})
						.accessibility(identifier: SchoolEntryIdentifier.phoneButton.rawValue)
					}
				}

				if school.website != nil || scores != nil {
					bottomButtons(website: school.website, scores: scores)
				}
			}
		}
	}

	@ViewBuilder
	func bottomButtons(website: String?, scores: Scores?) -> some View {
		Divider()
		HStack(spacing: 32) {
			if school.website != nil {
				Button("Website") {
					delegate.showWebsite(for: school)
				}
				.accessibility(identifier: SchoolEntryIdentifier.websiteButton.rawValue)
			}

			if let scores {
				Button("Scores") {
					showCard(scores)
				}
				.accessibility(identifier: SchoolEntryIdentifier.scoresButton.rawValue)
			}
		}
	}
}

#if DEBUG
#Preview {
	SchoolEntry(school: School.mockSchools[0], delegate: SchoolListViewModel(), scores: Scores.mockScores[0]) { scores in
			// do nothing
	}
}

#Preview("Hide bottom") {
	SchoolEntry(school: School.mockSchools[1], delegate: SchoolListViewModel(), scores: nil) { scores in
		// do nothing
	}
}
#endif
