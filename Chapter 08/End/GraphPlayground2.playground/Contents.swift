import SwiftUI
import Charts
import PlaygroundSupport

struct GraphData {
	let hour: Date
	let kWhGenerated: Double

	init(_ hour: Date, _ kWhGenerated: Double) {
		self.hour = hour
		self.kWhGenerated = kWhGenerated
	}
}

extension GraphData: Identifiable {
	var id: Date { hour }
}

extension Date {
	func timeFromString(_ timeString: String) -> Date {
		let calendar = Calendar.current

		var components = DateComponents()
		components.year = calendar.component(.year, from: self)
		components.month = calendar.component(.month, from: self)
		components.day = calendar.component(.day, from: self)

		let timeParts = timeString.split(separator: ":")
		components.hour = Int(timeParts.first ?? "") ?? 0
		components.minute = Int(timeParts.last ?? "") ?? 0
		return calendar.date(from: components) ?? self
	}
}

let winterAverage = [
	GraphData(Date().timeFromString("08:00"), 0.1),
	GraphData(Date().timeFromString("09:00"), 0.6),
	GraphData(Date().timeFromString("10:00"), 1.1),
	GraphData(Date().timeFromString("11:00"), 2.3),
	GraphData(Date().timeFromString("12:00"), 3.9),
	GraphData(Date().timeFromString("13:00"), 2.6),
	GraphData(Date().timeFromString("14:00"), 1.9),
	GraphData(Date().timeFromString("15:00"), 1.2),
	GraphData(Date().timeFromString("16:00"), 0.8),
	GraphData(Date().timeFromString("17:00"), 0.2),
	GraphData(Date().timeFromString("18:00"), 0)
]

struct ChartSample: View {
	var body: some View {
		Chart {
			ForEach(winterAverage) { output in
				LineMark(
					x: .value("Hour", output.hour, unit: .hour),
					y: .value("Kwh Generated", output.kWhGenerated)
				)
				.lineStyle(StrokeStyle(lineWidth: 4))

				AreaMark(
					x: .value("Hour", output.hour, unit: .hour),
					y: .value("Kwh Generated", output.kWhGenerated)
				)
				.opacity(0.5)
				.foregroundStyle(
					LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
				)
			}
			.interpolationMethod(.catmullRom)
		}
		.chartYAxis {
			AxisMarks(position: .leading)
		}
		.frame(width: 500, height: 500)
		.padding(32)
	}

}

PlaygroundPage.current.setLiveView(ChartSample())
