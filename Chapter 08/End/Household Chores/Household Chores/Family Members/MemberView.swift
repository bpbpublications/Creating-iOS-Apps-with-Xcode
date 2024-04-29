//
//  MemberView.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 7/30/23.
//

import SwiftUI
import CommonUI
import SwiftData

struct MemberView: View {
	@Bindable var member: FamilyMember
	@State private var addingChore: Bool = false
	@Query(filter: #Predicate<Chore>{ $0.assignedTo == nil })
	private var unassignedChores: [Chore]

	var body: some View {
		Form {
			Section("Name") {
				TextField("Name", text: $member.name)
			}

			Section(header: sectionHeader) {
				List(member.chores) { chore in
					Text(chore.name)
				}
			}
		}
		.navigationTitle("Family Member")
	}

	@ViewBuilder
	var sectionHeader: some View {
		HStack {
			Text("Chores")
			Spacer()
			AddButton("Add Chore") {
				addingChore.toggle()
			}
			.popover(isPresented: $addingChore) {
				VStack {
					Text("Select chore to assign")
						.style(.footer, color: .gray)

					List(unassignedChores) { chore in
						ChoreListItem(chore: chore)
							.onTapGesture {
								chore.assignedTo = member
								addingChore.toggle()
							}
					}
				}
				.frame(minWidth: 200, minHeight: 300)
				.padding()
			}
		}
	}
}

struct MemberView_Previews: PreviewProvider {
	static var previews: some View {
		MemberView(member: FamilyMember())
			.previewLayout(.sizeThatFits)
	}
}

