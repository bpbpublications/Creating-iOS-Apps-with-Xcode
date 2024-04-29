//
//  SampleFamilyMembers.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 11/23/23.
//

import Foundation

extension FamilyMember {
	static var sampleMembers: [FamilyMember] {
		let chores = Chore.sampleChores
		let m1 = FamilyMember(name: "Liam", chores: [chores[0], chores[1], chores[4], chores[7]])
		let m2 = FamilyMember(name: "Maria", chores: [chores[2], chores[5], chores[7]])
		let m3 = FamilyMember(name: "Amir", chores: [chores[3], chores[6]])

		return [m1, m2, m3]
	}
}
