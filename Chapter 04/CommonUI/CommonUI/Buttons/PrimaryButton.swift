//
//  Buttons.swift
//  CommonUI
//
//  Created by Aaron Bratcher on 7/23/23.
//

import SwiftUI

public struct PrimaryButton: View {
	private let action: Action
	private let text: LocalizedStringKey
	@Binding var inProgress: Bool
	@Environment(\.isEnabled) private var isEnabled

	private var backgroundColorStart: Color {
		if isEnabled {
			return UI.Button.Primary.Enabled.Background.gradientColorStart
		} else {
			return UI.Button.Primary.Disabled.Background.gradientColorStart
		}
	}

	private var backgroundColorEnd: Color {
		if isEnabled {
			return UI.Button.Primary.Enabled.Background.gradientColorEnd
		} else {
			return UI.Button.Primary.Disabled.Background.gradientColorEnd
		}
	}

	private var backgroundPointStart: UnitPoint {
		if isEnabled {
			return UI.Button.Primary.Enabled.Background.gradientPointStart
		} else {
			return UI.Button.Primary.Disabled.Background.gradientPointStart
		}
	}

	private var backgroundPointEnd: UnitPoint {
		if isEnabled {
			return UI.Button.Primary.Enabled.Background.gradientPointEnd
		} else {
			return UI.Button.Primary.Disabled.Background.gradientPointEnd
		}
	}

	private var labelColor: Color {
		if isEnabled {
			return UI.Button.Primary.Enabled.Label.color
		} else {
			return UI.Button.Primary.Disabled.Label.color
		}
	}

	private var labelStyle: Font {
		if isEnabled {
			return UI.Button.Primary.Enabled.Label.style
		} else {
			return UI.Button.Primary.Disabled.Label.style
		}
	}

	private var labelWeight: Font.Weight {
		if isEnabled {
			return UI.Button.Primary.Enabled.Label.weight
		} else {
			return UI.Button.Primary.Disabled.Label.weight
		}
	}

	public init(_ text: LocalizedStringKey, inProgress: Binding<Bool>, action: @escaping Action) {
		self.text = text
		self._inProgress = inProgress
		self.action = action
	}

	public var body: some View {
		Button(action: {
			if !inProgress {
				action()
			}
		}) {
			HStack {
				if inProgress {
					ProgressView()
						.tint(UI.Button.Primary.Enabled.Label.color)
				} else {
					Text(text)
						.font(labelStyle)
						.fontWeight(labelWeight)
				}
			}
			.frame(minWidth: 0, maxWidth: .infinity)
			.padding(UI.Button.Primary.padding)
			.foregroundColor(labelColor)
			.background(LinearGradient(gradient: Gradient(colors: [backgroundColorStart, backgroundColorEnd]), startPoint: backgroundPointStart, endPoint: backgroundPointEnd))
			.cornerRadius(UI.Button.Primary.cornerRadius)
		}
		.disabled(inProgress ? true : !isEnabled)
	}
}

#Preview("Enabled - No Progress") {
	PrimaryButton("Primary Button", inProgress: .constant(false)) {
		print("tapped")
	}
	.disabled(false)
	.padding()
}

#Preview("Enabled - Progress") {
	PrimaryButton("Primary Button", inProgress: .constant(true)) {
		print("tapped")
	}
	.disabled(false)
	.padding()
}

#Preview("Disabled - No Progress") {
	PrimaryButton("Primary Button", inProgress: .constant(false)) {
		print("tapped")
	}
	.disabled(true)
	.padding()
}

#Preview("Disabled - Progress") {
	PrimaryButton("Primary Button", inProgress: .constant(true)) {
		print("tapped")
	}
	.disabled(true)
	.padding()
}

