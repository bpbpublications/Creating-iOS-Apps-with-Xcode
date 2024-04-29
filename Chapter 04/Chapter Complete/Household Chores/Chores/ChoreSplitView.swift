//
//  ChoreSplitView.swift
//  Household Chores
//
//  Created by Aaron Bratcher on 8/9/23.
//

import SwiftUI

struct ChoreSplitView: View {
	@Binding var membersOrChores: MemberChore
	@Environment(DataModel.self) private var dataModel
	@State private var selectedChoreId: Chore.ID?

	var body: some View {
		NavigationSplitView(columnVisibility: .constant(.all)) {
			VStack {
				MemberChorePicker(pickerSelection: $membersOrChores)
				ChoreList(chores: dataModel.chores, selectedChoreId: $selectedChoreId)
				HStack {
					addChoreButton
						.padding()
					Spacer()
				}
			}
		} detail: {
			if let selectedChoreId {
				if let chore = choreData(from: selectedChoreId) {
					ChoreView(chore: chore)
				}
			} else {
				Text("Please select a chore")
					.style(.h1)
			}
		}
		.navigationSplitViewStyle(.balanced)
	}

	private var addChoreButton: some View {
		Button {
			let newChore = Chore(name: "new chore")
			dataModel.chores.append(newChore)
			selectedChoreId = newChore.id
		} label: {
			Image(systemName: "plus")
				.resizable()
				.tint(Color.black)
				.frame(width: 25, height: 25)
				.accessibility(label: Text("Add Chore"))
		}
	}

	private func choreData(from id: UUID) -> Binding<Chore>? {
		guard var filter = dataModel.chores.filter({ $0.id == id }).first else { return nil }
		return Binding(get: { filter }, set: { filter = $0 })
	}
}

#Preview {
	ChoreSplitView(membersOrChores: .constant(.chores))
		.environment(DataModel())
}
