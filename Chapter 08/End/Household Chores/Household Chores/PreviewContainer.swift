//
//  PreviewSampleData.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 11/3/23.
//

import SwiftUI
import SwiftData

class PreviewContainer {
	@MainActor
	static let container: ModelContainer = {
		do {
			let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
			let container = try ModelContainer(for: Chore.self, configurations: configuration)

			for chore in Chore.sampleChores {
				container.mainContext.insert(chore)
			}

			return container

		} catch {
			fatalError("Cannot create container")
		}
	}()
}
