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

let summerAverage = [
	GraphData(Date().timeFromString("08:00"), 0.9),
	GraphData(Date().timeFromString("09:00"), 2.6),
	GraphData(Date().timeFromString("10:00"), 3.5),
	GraphData(Date().timeFromString("11:00"), 5.1),
	GraphData(Date().timeFromString("12:00"), 7.9),
	GraphData(Date().timeFromString("13:00"), 8.0),
	GraphData(Date().timeFromString("14:00"), 7.4),
	GraphData(Date().timeFromString("15:00"), 6.8),
	GraphData(Date().timeFromString("16:00"), 5.2),
	GraphData(Date().timeFromString("17:00"), 4.6),
	GraphData(Date().timeFromString("18:00"), 2.7)
]

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

struct ChartSample: View {
	let seasons = [
		(season: "Winter", data: winterAverage),
		(season: "Summer", data: summerAverage)
	]

	var body: some View {
		Chart {
			ForEach(seasons, id: \.season) { season in
				ForEach(season.data) { output in
					LineMark(
						x: .value("Hour", output.hour, unit: .hour),
						y: .value("Kwh Generated", output.kWhGenerated)
					)
				}
				.foregroundStyle(by: .value("Season", season.season))
				.symbol(.cross)
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
