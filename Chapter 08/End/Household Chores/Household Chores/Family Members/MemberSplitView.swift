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

	@AppStorage("LoadedData") var loadedData = false
	@State private var showingChart = false

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
				Button(action: {
					showingChart.toggle()
				}, label: {
					Image(systemName: "chart.bar.fill")
				})
				
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
		.onAppear {
			loadSampleData()
		}
		.sheet(isPresented: $showingChart) {
			PercentCompleteChart(showingGraph: $showingChart)
				.padding()
		}
	}

	func loadSampleData() {
		guard !loadedData else { return }
		Chore.sampleChores.forEach { chore in
			context.insert(chore)
		}
		loadedData = true
	}
}

#Preview {
	MemberSplitView(membersOrChores: .constant(.members))
		.modelContainer(PreviewContainer.container)
}
