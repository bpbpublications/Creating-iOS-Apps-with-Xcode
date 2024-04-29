//
//  ChoreView.swift
//  Household Chores
//
//  Created by Aaron Bratcher on 7/27/23.
//

import SwiftUI
import CommonUI

struct ChoreView: View {
	@Binding var chore: Chore
	@Environment(DataModel.self) var dataModel

    var body: some View {
		 Card {
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
						 ForEach(dataModel.familyMembers) { member in
							 Text(member.name).tag(member as FamilyMember?)
						 }
					 }
				 }

				 Section("Complete") {
					 Toggle("Complete", isOn: $chore.isComplete)
				 }
			 }
			 .frame(maxHeight: 400)
			 .padding(-6)
		 }
    }
}

struct ChoreView_Previews: PreviewProvider {
	static var previews: some View {
		ChoreView(chore: .constant(Chore()))
			.previewLayout(.sizeThatFits)
	}
}
