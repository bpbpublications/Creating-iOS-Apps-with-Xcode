//
//  FamilyMember.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 7/26/23.
//

import Foundation
import SwiftData

@Model
class FamilyMember: Identifiable {
	@Attribute(.unique) var id: UUID = UUID()
	var name: String
	@Relationship(deleteRule: .nullify, inverse: \Chore.assignedTo)
	@Relationship(inverse: \Chore.assignedTo)
	var chores: [Chore]

	init(name: String = "", chores: [Chore] = []) {
		self.name = name
		self.chores = chores
	}
}

extension FamilyMember: Hashable {
	static func == (lhs: FamilyMember, rhs: FamilyMember) -> Bool {
		lhs.id == rhs.id
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}
