//
//  Chore.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 7/27/23.
//

import Foundation
import SwiftData

enum ChoreFrequency: String, CaseIterable, Identifiable, Codable {
	case daily, weekly, monthly, seasonal
	var id: ChoreFrequency { self }
}

@Model
class Chore: Identifiable {
	@Attribute(.unique) var id = UUID()
	var name: String
	var location: String
	var frequency: ChoreFrequency
	var assignedTo: FamilyMember?
	var isComplete: Bool
	var isArchived: Bool
	var dueDate: Date {
		didSet {
			dueDate = newValue.endOfDay
		}
	}

	init(name: String = "", location: String = "", frequency: ChoreFrequency = .daily, assignedTo: FamilyMember? = nil, isComplete: Bool = false, isArchived: Bool = false, dueDate: Date = Date()) {
		self.name = name
		self.location = location
		self.frequency = frequency
		self.assignedTo = assignedTo
		self.isComplete = isComplete
		self.isArchived = isArchived
		self.dueDate = dueDate
	}
}
