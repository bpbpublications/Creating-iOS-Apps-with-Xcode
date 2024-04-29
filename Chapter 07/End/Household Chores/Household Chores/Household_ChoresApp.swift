//
//  Household_ChoresApp.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 7/25/23.
//

import SwiftUI

@main
struct Household_ChoresApp: App {
	private let styleManager = StyleManager()

	var body: some Scene {
		WindowGroup {
			ContentView()
		}
			.modelContainer(for: Chore.self)
	}
}
