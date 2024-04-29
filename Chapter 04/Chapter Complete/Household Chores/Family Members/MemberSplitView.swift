//
//  MemberSplitView.swift
//  Household Chores
//
//  Created by Aaron Bratcher on 8/8/23.
//

import SwiftUI

struct MemberSplitView: View {
	@Binding var membersOrChores: MemberChore
	@Environment(DataModel.self) private var dataModel
	@State private var selectedMemberId: FamilyMember.ID?

	var body: some View {
		NavigationSplitView(columnVisibility: .constant(.all)) {
			VStack {
				MemberChorePicker(pickerSelection: $membersOrChores)
				List(dataModel.familyMembers, selection: $selectedMemberId) { member in
					Text(member.name)
						.style(.h2)
				}
				HStack {
					addMemberButton
						.padding()
					Spacer()
				}
			}
		} detail: {
			if let selectedMemberId {
				let member = memberData(from: selectedMemberId)
				MemberView(member: member)
			} else {
				Text("Please select a family member")
					.style(.h1)
			}
		}
		.navigationSplitViewStyle(.balanced)
	}

	private var addMemberButton: some View {
		Button {
			let newMember = FamilyMember(name: "new family member")
			dataModel.familyMembers.append(newMember)
			selectedMemberId = newMember.id
		} label: {
			Image(systemName: "plus")
				.resizable()
				.tint(Color.black)
				.frame(width: 25, height: 25)
				.accessibility(label: Text("Add Family Member"))
		}
	}

	private func memberData(from id: UUID) -> Binding<FamilyMember> {
		var filter = dataModel.familyMembers.filter({ $0.id == id }).first
		return Binding(get: {filter!}, set: {filter = $0})
	}
}

#Preview {
	MemberSplitView(membersOrChores: .constant(.members))
		.environment(DataModel())
}
