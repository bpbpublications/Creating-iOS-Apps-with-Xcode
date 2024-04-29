//
//  Household_ChoresApp.swift
//  Household Chores
//
//  Created by Aaron Bratcher on 7/25/23.
//

import SwiftUI

@main
struct Household_ChoresApp: App {
	@State private var dataModel = DataModel()
	private let styleManager = StyleManager()
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environment(dataModel)
		}
	}
}
