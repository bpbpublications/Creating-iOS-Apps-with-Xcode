//
//  Buttons.swift
//  CommonUI
//
//  Created by Aaron Bratcher on 7/23/23.
//

import SwiftUI

public struct SecondaryButton: View {
	private let action: Action
	private let text: LocalizedStringKey
	@Binding var inProgress: Bool
	@Environment(\.isEnabled) private var isEnabled

	private var borderColorStart: Color {
		if isEnabled {
			return UI.Button.Secondary.Enabled.Border.gradientColorStart
		} else {
			return UI.Button.Secondary.Disabled.Border.gradientColorStart
		}
	}

	private var borderColorEnd: Color {
		if isEnabled {
			return UI.Button.Secondary.Enabled.Border.gradientColorEnd
		} else {
			return UI.Button.Secondary.Disabled.Border.gradientColorEnd
		}
	}

	private var borderPointStart: UnitPoint {
		if isEnabled {
			return UI.Button.Secondary.Enabled.Border.gradientPointStart
		} else {
			return UI.Button.Secondary.Disabled.Border.gradientPointStart
		}
	}

	private var borderPointEnd: UnitPoint {
		if isEnabled {
			return UI.Button.Secondary.Enabled.Border.gradientPointEnd
		} else {
			return UI.Button.Secondary.Disabled.Border.gradientPointEnd
		}
	}

	private var backgroundColor: Color {
		if isEnabled {
			return UI.Button.Secondary.Enabled.Background.color
		} else {
			return UI.Button.Secondary.Disabled.Background.color
		}
	}

	private var labelColor: Color {
		if isEnabled {
			return UI.Button.Secondary.Enabled.Label.color
		} else {
			return UI.Button.Secondary.Disabled.Label.color
		}
	}

	private var labelStyle: Font {
		if isEnabled {
			return UI.Button.Secondary.Enabled.Label.style
		} else {
			return UI.Button.Secondary.Disabled.Label.style
		}
	}

	private var labelWeight: Font.Weight {
		if isEnabled {
			return UI.Button.Secondary.Enabled.Label.weight
		} else {
			return UI.Button.Secondary.Disabled.Label.weight
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
						.tint(UI.Button.Secondary.Enabled.Label.color)
						.frame(maxWidth: .infinity)
						.padding(UI.Button.Secondary.padding)
						.background(
							RoundedRectangle(cornerRadius: UI.Button.Secondary.cornerRadius)
								.stroke(LinearGradient(gradient: Gradient(colors: [borderColorStart, borderColorEnd]), startPoint: borderPointStart, endPoint: borderPointEnd), lineWidth: UI.Button.Secondary.borderThickness)
								.fill(backgroundColor)
							)
				} else {
					Text(text)
						.foregroundStyle(labelColor)
						.font(labelStyle)
						.fontWeight(labelWeight)
						.frame(maxWidth: .infinity)
						.padding(UI.Button.Secondary.padding)
						.background(
							RoundedRectangle(cornerRadius: UI.Button.Secondary.cornerRadius)
								.stroke(LinearGradient(gradient: Gradient(colors: [borderColorStart, borderColorEnd]), startPoint: borderPointStart, endPoint: borderPointEnd), lineWidth: UI.Button.Secondary.borderThickness)
								.fill(backgroundColor)
						)
				}
			}
		}
		.disabled(inProgress ? true : !isEnabled)
	}
}

#Preview("Enabled - No Progress") {
	SecondaryButton("Secondary Button", inProgress: .constant(false)) {
		print("tapped")
	}
	.disabled(false)
	.padding()
}

#Preview("Enabled - Progress") {
	SecondaryButton("Secondary Button", inProgress: .constant(true)) {
		print("tapped")
	}
	.disabled(false)
	.padding()
}

#Preview("Disabled - No Progress") {
	SecondaryButton("Secondary Button", inProgress: .constant(false)) {
		print("tapped")
	}
	.disabled(true)
	.padding()
}

#Preview("Disabled - Progress") {
	SecondaryButton("Secondary Button", inProgress: .constant(true)) {
		print("tapped")
	}
	.disabled(true)
	.padding()
}

