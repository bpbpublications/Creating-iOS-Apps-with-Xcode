//
//  DateExtensions.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 9/9/23.
//

import Foundation

extension Date: RawRepresentable {
	public var rawValue: Int {
		Int(self.timeIntervalSince1970)
	}

	public init(rawValue: Int) {
		self = Date(timeIntervalSince1970: Double(rawValue))
	}
}

extension Date {
	static let relativeDateStyle = Date.RelativeFormatStyle()

	var relativeTimestamp: String {
		let seconds = self.timeIntervalSince(Date())
		if let past = Calendar.current.date(byAdding: .second, value: Int(seconds), to: Date()) {
			return past.formatted(Date.relativeDateStyle)
		}

		return ""
	}

	var startOfDay: Date {
		let calendar = Calendar.current
		let year = calendar.component(.year, from: self)
		let month = calendar.component(.month, from: self)
		let day = calendar.component(.day, from: self)

		var components = DateComponents()
		components.year = year
		components.month = month
		components.day = day

		let start = calendar.date(from: components) ?? Date(timeIntervalSince1970: 0)
		return start
	}

	var endOfDay: Date {
		let calendar = Calendar.current
		let year = calendar.component(.year, from: self)
		let month = calendar.component(.month, from: self)
		let day = calendar.component(.day, from: self)

		var components = DateComponents()
		components.year = year
		components.month = month
		components.day = day

		let start = calendar.date(from: components) ?? Date(timeIntervalSince1970: 0)

		let endComponents = DateComponents(day:1, second: -1)
		let midnight = calendar.date(byAdding: endComponents, to: start) ?? Date(timeIntervalSince1970: 0)

		return midnight
	}

	var endOfNextDay: Date {
		let calendar = Calendar.current
		let year = calendar.component(.year, from: self)
		let month = calendar.component(.month, from: self)
		let day = calendar.component(.day, from: self)

		var components = DateComponents()
		components.year = year
		components.month = month
		components.day = day

		let start = calendar.date(from: components) ?? Date(timeIntervalSince1970: 0)

		let endComponents = DateComponents(day:1)
		let midnight = calendar.date(byAdding: endComponents, to: start) ?? Date(timeIntervalSince1970: 0)

		return midnight.endOfDay
	}

	var startOfWeek: Date {
		let calendar = Calendar.current
		let year = calendar.component(.yearForWeekOfYear, from: self)
		let startComponents = DateComponents(weekOfYear: calendar.component(.weekOfYear, from: self), yearForWeekOfYear: year)
		let firstDay = calendar.date(from: startComponents) ?? Date(timeIntervalSince1970: 0)
		return firstDay
	}

	var endOfWeek: Date {
		let calendar = Calendar.current
		let endComponents = DateComponents(day:7, second: -1)
		let lastDay = calendar.date(byAdding: endComponents, to: startOfWeek) ?? Date(timeIntervalSince1970: 0)
		return lastDay.endOfDay
	}

	var endOfNextWeek: Date {
		let calendar = Calendar.current
		let endComponents = DateComponents(day:7)
		let lastDay = calendar.date(byAdding: endComponents, to: startOfWeek) ?? Date(timeIntervalSince1970: 0)
		return lastDay.endOfWeek
	}

	var startOfMonth: Date {
		let calendar = Calendar.current
		let firstDay = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self))) ?? Date(timeIntervalSince1970: 0)
		return firstDay
	}

	var endOfMonth: Date {
		let calendar = Calendar.current
		let lastDay = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth) ?? Date(timeIntervalSince1970: 0)
		return lastDay.endOfDay
	}

	var endOfNextMonth: Date {
		let calendar = Calendar.current
		let lastDay = calendar.date(byAdding: DateComponents(month: 1), to: startOfMonth) ?? Date(timeIntervalSince1970: 0)
		return lastDay.endOfMonth
	}

	var startOfQuarter: Date {
		let calendar = Calendar.current
		let weekNumber = calendar.component(.weekOfYear, from: self)
		let mod = weekNumber % 13
		let firstWeekOfQuarter: Int
		if mod == 0 {
			firstWeekOfQuarter = weekNumber - 12
		} else {
			firstWeekOfQuarter = weekNumber - mod + 1
		}

		let year = calendar.component(.year, from: self)
		let dateComponents = DateComponents(calendar: calendar, year: year, weekday: 1, weekOfYear: firstWeekOfQuarter)
		let firstDay = calendar.date(from: dateComponents) ?? Date(timeIntervalSince1970: 0)

		return firstDay
	}

	var endOfQuarter: Date {
		let calendar = Calendar.current
		let dateComponents = DateComponents(day: 91, second: -1)
		let lastDay = calendar.date(byAdding: dateComponents, to: startOfQuarter) ?? Date(timeIntervalSince1970: 0)
		return lastDay.endOfDay
	}

	var endOfNextQuarter: Date {
		let calendar = Calendar.current
		let dateComponents = DateComponents(day: 91)
		let lastDay = calendar.date(byAdding: dateComponents, to: startOfQuarter) ?? Date(timeIntervalSince1970: 0)
		return lastDay.endOfQuarter
	}

	var startOfYear: Date {
		let calendar = Calendar.current
		let components = calendar.dateComponents([.year], from: Date())
		let startDate = calendar.date(from: components) ?? Date(timeIntervalSince1970: 0)
		return startDate
	}

	var endOfYear: Date {
		let calendar = Calendar.current
		let endComponents = DateComponents(year:1, second: -1)
		let lastDay = calendar.date(byAdding: endComponents, to: startOfYear) ?? Date(timeIntervalSince1970: 0)
		return lastDay.endOfDay
	}

	var endOfNextYear: Date {
		let calendar = Calendar.current
		let endComponents = DateComponents(year:1)
		let lastDay = calendar.date(byAdding: endComponents, to: startOfYear) ?? Date(timeIntervalSince1970: 0)
		return lastDay.endOfYear
	}
}
