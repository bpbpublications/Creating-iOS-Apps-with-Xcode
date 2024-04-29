//
//  Chore.swift
//  Household Chores
//
//  Created by Aaron Bratcher on 7/27/23.
//

import Foundation

@Observable
class Chore: Identifiable {
	var id = UUID()
	var name = ""
	var frequency = ""
	var assignedTo = ""
	var complete = false

	init(name: String = "", frequency: String = "", assignedTo: String = "", complete: Bool = false) {
		self.name = name
		self.frequency = frequency
		self.assignedTo = assignedTo
		self.complete = complete
	}

#if DEBUG
	static var sampleChores: [Chore] {
		let c1 = Chore(name: "Bedroom – Pickup", frequency: "daily", assignedTo: "Liam")
		let c2 = Chore(name: "Bedroom – Make Bed", frequency: "daily", assignedTo: "Liam")
		let c3 = Chore(name: "Living space – Pickup", frequency: "daily", assignedTo: "Maria")
		let c4 = Chore(name: "Kitchen – Dishes", frequency: "daily", assignedTo: "Amir")
		let c5 = Chore(name: "Bathroom – Pickup", frequency: "daily", assignedTo: "Liam")
		let c6 = Chore(name: "Bedroom – Clean Floor", frequency: "weekly", assignedTo: "Maria")
		let c7 = Chore(name: "Kitchen – Clean Floor", frequency: "weekly", assignedTo: "Amir")
		let c8 = Chore(name: "Home – Wipe baseboards & door frames", frequency: "monthly", assignedTo: "Liam")
		let c9 = Chore(name: "Home – Clean under furniture", frequency: "seasonal", assignedTo: "Maria")
		return [c1, c2, c3, c4, c5, c6, c7, c8, c9]
	}
#endif
}
