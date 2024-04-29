//
//  ProgressBars.swift
//  CommonUI
//
//  Created by Aaron Bratcher on 7/23/23.
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
		HStack(spacing: UI.ProgressBars.indicatorPadding) {
			ForEach(1...4, id: \.self) { index in
				Rectangle()
					.fill(segmentColor(segment: index))
					.stroke(UI.ProgressBars.indicatorBorderColor, lineWidth: UI.ProgressBars.indicatorBorderThickness)
					.frame(height: UI.ProgressBars.indicatorHeight)
			}

		}
		.frame(maxWidth: .infinity)
		.padding(UI.ProgressBars.padding)
		 .background {
			 RoundedRectangle(cornerRadius: UI.ProgressBars.cornerRadius)
				 .stroke(UI.ProgressBars.borderColor, lineWidth: UI.ProgressBars.borderWidth)
				 .fill(Color.clear)
		 }
    }

	private func segmentColor(segment: Int) -> Color {
		switch segment {
		case 1:
			return fillColor
		case 2:
			return percent > 33 ? fillColor : .white
		case 3:
			return percent > 66 ? fillColor : .white
		default:
			return percent > 99 ? fillColor : .white
		}
	}

	private var fillColor: Color {
		switch percent {
		case 0...33:
			return .red
		case 34...66:
			return .orange
		case 67...99:
			return .yellow
		default:
			return .green
		}
	}
}

#Preview("1 bar") {
	ProgressBars(progress: 0.33)
			.frame(width: 40)
			.padding()
}

#Preview("2 bars") {
	ProgressBars(progress: 0.66)
		.frame(width: 40)
		.padding()
}

#Preview("3 bars") {
	ProgressBars(progress: 0.99)
		.frame(width: 40)
		.padding()
}

#Preview("4 bars") {
	ProgressBars(progress: 1)
		.frame(width: 40)
		.padding()
}

