import SwiftUI
import Charts
import PlaygroundSupport

struct GraphData {
	let familyMember: String
	let percentComplete: Double

	init(_ familyMember: String, _ percentComplete: Double) {
		self.familyMember = familyMember
		self.percentComplete = percentComplete
	}
}

extension GraphData: Identifiable {
	var id: String { familyMember }
}

struct ChartSample: View {
	let memberData = [
		GraphData("Liam", 20),
		GraphData("Maria", 40),
		GraphData("Amir", 30)
	]

	var body: some View {
		Chart {
			ForEach(memberData) { data in
				BarMark(
					x: .value("% Complete", data.percentComplete),
					y: .value("Name", data.familyMember)
				)
			}
		}
		.chartXScale(domain: 0...100)
		.frame(width: 500, height: 500)
		.padding(32)
	}

}

PlaygroundPage.current.setLiveView(ChartSample())
