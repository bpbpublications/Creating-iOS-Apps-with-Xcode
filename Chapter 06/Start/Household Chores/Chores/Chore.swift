//
//  Chore.swift
//  Household Chores
//
//  Created by Aaron Bratcher on 7/27/23.
//

import Foundation

enum ChoreFrequency: String, CaseIterable, Identifiable {
	case daily, weekly, monthly, seasonal
	var id: ChoreFrequency { self }
}

@Observable
class Chore: Identifiable {
	var id = UUID()
	var name: String
	var location: String
	var frequency: ChoreFrequency
	var assignedTo: FamilyMember?
	var isComplete: Bool
	var isArchived: Bool
	var dueDate: Date

	init(name: String = "", location: String = "", frequency: ChoreFrequency = .daily, assignedTo: FamilyMember? = nil, isComplete: Bool = false, isArchived: Bool = false, dueDate: Date = Date()) {
		self.name = name
		self.location = location
		self.frequency = frequency
		self.assignedTo = assignedTo
		self.isComplete = isComplete
		self.isArchived = isArchived
		self.dueDate = dueDate
	}

#if DEBUG
	static var sampleChores: [Chore] {
		let liam = FamilyMember(name: "Liam")
		let maria = FamilyMember(name: "Maria")
		let amir = FamilyMember(name: "Amir")

		let c1 = Chore(name: "Pickup", location: "Bedroom", frequency: .daily, assignedTo: liam)
		let c2 = Chore(name: "Make Bed", location: "Bedroom", frequency: .daily, assignedTo: liam)
		let c3 = Chore(name: "Pickup", location: "Living space", frequency: .daily, assignedTo: maria)
		let c4 = Chore(name: "Dishes", location: "Kitchen", frequency: .daily, assignedTo: amir)
		let c5 = Chore(name: "Pickup", location: "Bathroom", frequency: .daily, assignedTo: liam)
		let c6 = Chore(name: "Clean Floor", location: "Bedroom", frequency: .weekly, assignedTo: maria)
		let c7 = Chore(name: "Clean Floor", location: "Kitchen", frequency: .weekly, assignedTo: amir)
		let c8 = Chore(name: "Wipe baseboards & door frames", location: "Home", frequency: .monthly, assignedTo: liam)
		let c9 = Chore(name: "Clean under furniture", location: "Home", frequency: .seasonal, assignedTo: maria)
		return [c1, c2, c3, c4, c5, c6, c7, c8, c9]
	}
#endif
}
