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

    var body: some View {
		 Card {
			 Form {
				 Section("Name") {
					 TextField("Name", text: $chore.name)
				 }

				 Section("Frequency") {
					 TextField("Frequency", text: $chore.frequency)
				 }

				 Section("Assigned to") {
					 TextField("Assigned to", text: $chore.assignedTo)
				 }

				 Section("Complete") {
					 Toggle("Complete", isOn: $chore.complete)
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
