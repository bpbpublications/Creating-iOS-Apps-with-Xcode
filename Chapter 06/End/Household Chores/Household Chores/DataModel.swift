//
//  DataModel.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 8/9/23.
//

import Foundation

@Observable
class DataModel {
	var chores: [Chore] = Chore.sampleChores
	var familyMembers: [FamilyMember] = FamilyMember.sampleMembers
}
