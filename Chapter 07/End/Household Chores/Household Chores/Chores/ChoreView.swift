//
//  ChoreView.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 7/27/23.
//

import SwiftUI
import CommonUI
import SwiftData

struct ChoreView: View {
	@Bindable var chore: Chore
	@Binding var selectedChore: Chore?
	@Query private var familyMembers: [FamilyMember]

	var body: some View {
		Form {
			Section("Name") {
				TextField("Name", text: $chore.name)
			}

			Section("Location") {
				TextField("Location", text: $chore.location)
			}

			Section("Frequency") {
				Picker(selection: $chore.frequency, label: EmptyView()) {
					ForEach(ChoreFrequency.allCases) { frequency in
						Text(frequency.rawValue.localized).tag(frequency.rawValue)
					}
				}
			}

			Section("Assigned to") {
				Picker(selection: $chore.assignedTo, label: EmptyView()) {
					Text("Unassigned".localized).tag(Optional<FamilyMember>(nilLiteral: ()))
					ForEach(familyMembers) { member in
						Text(member.name).tag(member as FamilyMember?)
					}
				}
			}

			Section("Complete") {
				Toggle("Complete", isOn: $chore.isComplete)
			}
		}
		.navigationTitle("Chore")
	}
}

struct ChoreView_Previews: PreviewProvider {
	static var previews: some View {
		ChoreView(chore: Chore.sampleChores[0], selectedChore: .constant(nil))
			.previewLayout(.sizeThatFits)
	}
}
