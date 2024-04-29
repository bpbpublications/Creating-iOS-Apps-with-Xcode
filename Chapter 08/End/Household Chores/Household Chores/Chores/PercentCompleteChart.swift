//
//  PercentCompleteGraph.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 11/22/23.
//

import SwiftUI
import SwiftData
import Charts
import CommonUI

struct CompletionRate {
	var name: String
	var percentComplete: Double
}

struct PercentCompleteChart: View {
	@Binding var showingGraph: Bool
	@State var completionRates: [CompletionRate] = []
	@Environment(\.modelContext) private var context
	@Query private var archivedChores: [Chore]

	init(showingGraph: Binding<Bool>) {
		self._showingGraph = showingGraph

		let startDate = Calendar
			.current
			.date(byAdding: .day, value: -7, to: Date())?
			.endOfDay ?? Date()

		let endDate = Date().startOfDay

		let predicate = #Predicate<Chore> {
			($0.dueDate >= startDate
			 && $0.dueDate < endDate
			 && $0.isArchived)
		}

		_archivedChores = Query(filter: predicate)
	}

	var body: some View {
		VStack {
			header
			chart
		}
		.onAppear {
			completionRates = calculateCompletionRates(from: archivedChores)
		}
	}

	var header: some View {
		VStack {
			HStack {
				VStack(alignment: .leading) {
					Text("% Chores Complete")
						.style(.h2)
					Text("Last 7 Days")
						.style(.paragraph)
				}
				Spacer()
				TertiaryButton("Done") {
					showingGraph.toggle()
				}
				.fixedSize()
			}

			Divider()
				.frame(height: 1.0)
				.overlay(.gray)
		}
	}

	var chart: some View {
		Chart(completionRates, id: \.name) { rate in
			BarMark(
				x: .value("Name", rate.name),
				y: .value("Completed", rate.percentComplete)
			)
			.annotation(position: .overlay, alignment: .center) {
				Text("\(rate.percentComplete, format: .number.precision(.fractionLength(0)))")
											.foregroundColor(.white)
								 }
		}
		.chartYScale(domain: 0...100)
	}

	func calculateCompletionRates(from chores: [Chore]) -> [CompletionRate] {
		struct Amounts {
			var chores = 0
			var completed = 0
		}

		var choreAmounts: [String: Amounts] = [:]

		for chore in chores {
			let name = chore.assignedTo?.name ?? "Unassigned"
			var amounts = choreAmounts[name] ?? Amounts()

			amounts.chores += 1
			amounts.completed += chore.isComplete ? 1 : 0
			choreAmounts[name] = amounts
		}

		var completionRates: [CompletionRate] = []

		for (name, amounts) in choreAmounts {
			let completionRate = CompletionRate(name: name, percentComplete: Double(amounts.completed) / Double(amounts.chores) * 100)
			completionRates.append(completionRate)
		}

		return completionRates
	}
}

#Preview {
	PercentCompleteChart(showingGraph: .constant(true))
		.modelContainer(PreviewContainer.container)
}
