//
//  MemberSplitView.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 8/8/23.
//

import SwiftUI
import SwiftData

struct MemberSplitView: View {
	@Binding var membersOrChores: MemberChore
	@Environment(\.modelContext) private var context
	@State private var selectedMember: FamilyMember?
	@Query private var familyMembers: [FamilyMember]

	var body: some View {
		NavigationSplitView(columnVisibility: .constant(.all)) {
			VStack {
				MemberChorePicker(pickerSelection: $membersOrChores)
				List(familyMembers, selection: $selectedMember) { member in
					NavigationLink {
						MemberView(member: member)
					} label: {
						Text(member.name)
							.style(.h2)
					}
					.swipeActions(edge: .trailing) {
						Button(role: .destructive) {
							context.delete(member)
						} label: {
							Image(systemName: "trash.fill")
						}
					}
				}
			}
			.toolbar {
				AddButton("Add Family Member") {
					let newMember = FamilyMember(name: "new family member")
					context.insert(newMember)
					selectedMember = newMember
				}
			}

		} detail: {
			if let selectedMember {
				MemberView(member: selectedMember)
			} else {
				Text("Please select a family member")
					.style(.h1)
			}
		}
		.navigationSplitViewStyle(.balanced)
	}
}

#Preview {
	MemberSplitView(membersOrChores: .constant(.members))
		.modelContainer(PreviewContainer.container)
}
