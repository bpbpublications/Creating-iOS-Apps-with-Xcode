//
//  ChoreList.swift
//  Household Chores
//
//  Created by Aaron Bratcher on 7/29/23.
//

import SwiftUI

struct ChoreList: View {
	let chores: [Chore]
	@Binding var selectedChoreId: Chore.ID?

	var body: some View {
		List(chores, selection: $selectedChoreId) { chore in
			ChoreListItem(chore: chore)
		}
	}
}

#Preview {
	ChoreList(chores: Chore.sampleChores, selectedChoreId: .constant(nil))
}
