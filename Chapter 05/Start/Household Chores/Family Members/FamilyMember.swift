//
//  FamilyMember.swift
//  Household Chores
//
//  Created by Aaron Bratcher on 7/26/23.
//

import Foundation

@Observable
class FamilyMember: Identifiable {
	var id = UUID()
	var name = ""
	var chores: [Chore] = []

	init(name: String = "", chores: [Chore] = []) {
		self.name = name
		self.chores = chores
	}

	#if DEBUG
	static var sampleMembers: [FamilyMember] {
		let chores = Chore.sampleChores
		let m1 = FamilyMember(name: "Liam", chores: [chores[0], chores[1], chores[4], chores[7]])
		let m2 = FamilyMember(name: "Maria", chores: [chores[2], chores[5], chores[7]])
		let m3 = FamilyMember(name: "Amir", chores: [chores[3], chores[6]])

		return [m1, m2, m3]
	}
	#endif
}
