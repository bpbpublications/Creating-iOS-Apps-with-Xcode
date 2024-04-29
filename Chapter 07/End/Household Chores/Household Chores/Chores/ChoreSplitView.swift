//
//  ChoreSplitView.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 8/9/23.
//

import SwiftUI
import SwiftData

struct ChoreSplitView: View {
	@Binding var membersOrChores: MemberChore
	@Environment(\.modelContext) private var context
	@State private var selectedChore: Chore?

	@Query private var chores: [Chore]
	@Query private var expiredChores: [Chore]
	@AppStorage(ChorePreference.lastChoreRenew) var lastChoreRenew: Int = 0

	init(membersOrChores: Binding<MemberChore>, showCompleted: Bool, showPastDue: Bool) {
		self._membersOrChores = membersOrChores

		let now = Date()
		let endOfDay = now.endOfDay
		let startOfDay = now.startOfDay

		let chorePredicate = #Predicate<Chore> {
			($0.dueDate <= endOfDay && !$0.isArchived && !$0.isComplete)
			|| ($0.dueDate <= endOfDay && showCompleted && $0.isComplete)
			|| ($0.dueDate <= startOfDay && showPastDue && !$0.isComplete)
		}
		_chores = Query(filter: chorePredicate, sort: \.dueDate)

		let expiredChoresPredicate: Predicate<Chore> = #Predicate<Chore> {
			!$0.isArchived && $0.dueDate <= startOfDay
		}

		_expiredChores = Query(filter: expiredChoresPredicate)
	}


	var body: some View {
		NavigationSplitView(columnVisibility: .constant(.all)) {
			VStack {
				MemberChorePicker(pickerSelection: $membersOrChores)
				List(chores, selection: $selectedChore) { chore in
					NavigationLink {
						ChoreView(chore: chore, selectedChore: $selectedChore)
					} label: {
						ChoreListItem(chore: chore)
					}
					.swipeActions(edge: .trailing) {
						Button(role: .destructive) {
							context.delete(chore)
						} label: {
							Image(systemName: "trash.fill")
						}
					}
				}
			}
			.toolbar {
				ToolbarItem(placement: .topBarLeading) {
					Text("Chores: \(chores.count)")
				}
				ToolbarItem(placement: .topBarTrailing) {
					AddButton("Add Chore") {
						let newChore = Chore(name: "new chore")
						context.insert(newChore)
						selectedChore = newChore
					}
				}
			}
		} detail: {
			if let selectedChore {
				ChoreView(chore: selectedChore, selectedChore: $selectedChore)
			} else {
				Text("Please select a chore")
					.style(.h1)
			}
		}
		.navigationSplitViewStyle(.balanced)
		.onAppear {
			renewChores()
		}
	}

	private func renewChores() {
		// check if 4 hours have passed since last run
		let lastRenewDate = Date(rawValue: lastChoreRenew)
		let elapsedSeconds = abs(lastRenewDate.timeIntervalSinceNow)
		guard elapsedSeconds > (60 * 60 * 4) else { return }

		for chore in expiredChores {
			chore.isArchived = true
			for newChore in newChores(from: chore) {
				context.insert(newChore)
			}
		}

		lastChoreRenew = Date().rawValue
	}

	private func newChores(from chore: Chore, using now: Date = Date()) -> [Chore] {
		var newChores: [Chore] = []

		let endOfDay = now.endOfDay
		var newDate = chore.dueDate

		repeat {
			switch chore.frequency {
			case .daily:
				newDate = newDate.endOfNextDay
			case .weekly:
				newDate = newDate.endOfNextWeek
			case .monthly:
				newDate = newDate.endOfNextMonth
			case .seasonal:
				newDate = newDate.endOfNextQuarter
			}

			let isArchived = newDate < endOfDay

			let newChore = Chore(name: chore.name, location: chore.location, frequency: chore.frequency, assignedTo: chore.assignedTo, isArchived: isArchived, dueDate: newDate)

			newChores.append(newChore)
		} while newDate < endOfDay

		return newChores
	}
}

#Preview("Current Chores") {
	ChoreSplitView(membersOrChores: .constant(.chores), showCompleted: false, showPastDue: false)
		.modelContainer(PreviewContainer.container)
}

#Preview("Completed Chores") {
	ChoreSplitView(membersOrChores: .constant(.chores), showCompleted: true, showPastDue: false)
		.modelContainer(PreviewContainer.container)
}

#Preview("Past Due Chores") {
	ChoreSplitView(membersOrChores: .constant(.chores), showCompleted: false, showPastDue: true)
		.modelContainer(PreviewContainer.container)
}
