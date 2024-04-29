//
//  ProgressBars.swift
//  PizzaUI
//
//  Created by Aaron L Bratcher on 12/16/23.
//

import SwiftUI

public struct ProgressBars: View {
	private let progress: Double
	private var percent: Int {
		Int(progress * 100.0)
	}

	public init(progress: Double) {
		self.progress = progress
	}

	public var body: some View {
		HStack(spacing: 0) {
			ForEach(1...4, id: \.self) { index in
				Rectangle()
					.fill(segmentColor(segment: index))
			}

		}
		.frame(maxWidth: .infinity)
		.padding(4)
		 .background {
			 RoundedRectangle(cornerRadius: 4)
				 .stroke(.gray, lineWidth: 1)
				 .fill(Color.clear)
		 }
	 }

	private func segmentColor(segment: Int) -> Color {
		switch segment {
		case 1:
			return percent > 0 ? fillColor : .white
		case 2:
			return percent > 25 ? fillColor : .white
		case 3:
			return percent > 50 ? fillColor : .white
		case 4:
			return percent > 75 ? fillColor : .white
		default:
			return .white
		}
	}

	private var fillColor: Color {
		switch percent {
		case 0...25:
			return Color("Timer/Progress1")
		case 26...50:
			return Color("Timer/Progress2")
		case 51...75:
			return Color("Timer/Progress3")
		case 76...100:
			return Color("Timer/Progress4")
		default:
			return .white
		}
	}
}

#Preview("1 bar") {
	ProgressBars(progress: 0.24)
		.frame(height: 20)
			.padding()
}

#Preview("2 bars") {
	ProgressBars(progress: 0.35)
		.frame(height: 20)
		.padding()
}

#Preview("3 bars") {
	ProgressBars(progress: 0.53)
		.frame(height: 20)
		.padding()
}

#Preview("4 bars") {
	ProgressBars(progress: 0.80)
		.frame(height: 20)
		.padding()
}

