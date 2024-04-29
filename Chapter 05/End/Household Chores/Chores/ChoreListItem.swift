//
//  ChoreListItem.swift
//  Household Chores
//
//  Created by Aaron Bratcher on 7/29/23.
//

import SwiftUI
import CommonUI

struct ChoreListItem: View {
	let chore: Chore

	var body: some View {
		VStack(alignment: .leading) {
			Text(chore.name)
				.style(.h2)
			Text(chore.assignedTo?.name ?? "Unassigned".localized)
				.style(.paragraph, color: .gray)
				.bold()
		}
	}
}

#Preview {
	ChoreListItem(chore: Chore.sampleChores[0])
}
