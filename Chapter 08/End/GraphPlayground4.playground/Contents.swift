import SwiftUI
import Charts
import PlaygroundSupport

struct GraphData {
	let familyMember: String
	let percentOfChores: Double

	init(_ familyMember: String, _ percentOfChores: Double) {
		self.familyMember = familyMember
		self.percentOfChores = percentOfChores
	}
}

extension GraphData: Identifiable {
	var id: String { familyMember }
}

struct ChartSample: View {
	let memberData = [
		GraphData("Liam", 0.44),
		GraphData("Maria", 0.33),
		GraphData("Amir", 0.22)
	]

	var body: some View {
		ScrollView {
			VStack {
				Chart(memberData) { data in
					BarMark(
						x: .value("% of Chores", data.percentOfChores),
						stacking: .normalized
					)
					.foregroundStyle(by: .value("Name", data.familyMember))
				}
				.chartXAxis(.hidden)
				.frame(width: 500, height: 50)
				.padding(32)

				Chart(memberData) { data in
					SectorMark(
						angle: .value("% of Chores", data.percentOfChores),
						angularInset: 2.0
					)
					.foregroundStyle(by: .value("Name", data.familyMember))
				}
				.frame(width: 500, height: 500)
				.padding(32)

				Chart(memberData) { data in
					SectorMark(
						angle: .value("% of Chores", data.percentOfChores),
						innerRadius: .ratio(0.95),
						angularInset: 2.0
					)
					.cornerRadius(12.0)
					.foregroundStyle(by: .value("Name", data.familyMember))
				}
				.chartBackground { chartProxy in
					GeometryReader { geometry in
						let frame = geometry[chartProxy.plotFrame!]
						VStack {
							Text("Chore")
							Text("Distribution")
						}
						.bold()
						.position(x: frame.midX, y: frame.midY)
					}
				}
				.frame(width: 500, height: 500)
				.padding(.bottom,500)
			}
		}
	}
}

PlaygroundPage.current.setLiveView(ChartSample())
