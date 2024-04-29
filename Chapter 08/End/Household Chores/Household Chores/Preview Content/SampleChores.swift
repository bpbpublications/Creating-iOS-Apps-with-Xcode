//
//  SampleChores.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 11/23/23.
//

import Foundation

extension Chore {
	static var sampleChores: [Chore] {
		let liam = FamilyMember(name: "Liam")
		let maria = FamilyMember(name: "Maria")
		let amir = FamilyMember(name: "Amir")

		var chores: [Chore] = []

		var isComplete: Bool {
			let random = Int.random(in: (0...100))
			return random > 30
		}

		for day in (-7...0) {
			let isArchived: Bool
			let dueDate: Date

			if day == 0 {
				dueDate = Date().endOfDay
				isArchived = false
			} else {
				dueDate = Calendar
							.current
							.date(byAdding: .day, value: day, to: Date())?
							.endOfDay ?? Date()
				isArchived = true
			}

			let liamChore = Chore(
				name: "Pickup", 
				location: "Bedroom",
				frequency: .daily,
				assignedTo: liam,
				isComplete: isComplete,
				isArchived: isArchived,
				dueDate: dueDate
			)

			let mariaChore = Chore(
				name: "Pickup",
				location: "Living room",
				frequency: .daily,
				assignedTo: maria,
				isComplete: isComplete,
				isArchived: isArchived,
				dueDate: dueDate
			)

			let amirChore = Chore(
				name: "Dishes", 
				location: "Kitchen",
				frequency: .daily,
				assignedTo: amir,
				isComplete: isComplete,
				isArchived: isArchived,
				dueDate: dueDate
			)

			chores.append(contentsOf: [liamChore, mariaChore, amirChore])
		}

		return chores
	}
}
