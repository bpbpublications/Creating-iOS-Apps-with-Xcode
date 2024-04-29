//
//  ButtonView.swift
//  CommonUI
//
//  Created by Aaron L Bratcher on 3/24/24.
//

import SwiftUI

struct ButtonView: View {
	private let buttonType: ButtonType
	private let action: Action
	private let text: LocalizedStringKey
	@Binding var inProgress: Bool
	@Environment(\.isEnabled) private var isEnabled

	public init(_ text: LocalizedStringKey, buttonType: ButtonType, inProgress: Binding<Bool>, action: @escaping Action) {
		self.text = text
		self.buttonType = buttonType
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
						.tint(progressViewColor)
						.frame(maxWidth: .infinity)
						.padding(padding)
						.background(backgroundView)
				} else {
					Text(text)
						.foregroundStyle(labelColor)
						.font(labelStyle)
						.fontWeight(labelWeight)
						.frame(maxWidth: .infinity)
						.padding(padding)
						.background(backgroundView)
				}
			}
		}
		.disabled(inProgress ? true : !isEnabled)
	}

	@ViewBuilder
	private var backgroundView: some View {
		if borderColorStart != nil {
			border
		} else {
			backgroundColor
		}
	}

	@ViewBuilder
	private var backgroundColor: some View {
		if let backgroundColorStart, let backgroundColorEnd, let backgroundPointStart, let backgroundPointEnd {
			LinearGradient(gradient: Gradient(colors: [backgroundColorStart, backgroundColorEnd]), startPoint: backgroundPointStart, endPoint: backgroundPointEnd)
				.cornerRadius(cornerRadius)
		} else {
			EmptyView()
		}
	}

	@ViewBuilder
	private var border: some View {
		if let borderColorStart, let borderColorEnd, let borderPointStart, let borderPointEnd {
			RoundedRectangle(cornerRadius: cornerRadius)
				.stroke(LinearGradient(gradient: Gradient(colors: [borderColorStart, borderColorEnd]), startPoint: borderPointStart, endPoint: borderPointEnd), lineWidth: borderThickness)
				.fill(LinearGradient(gradient: Gradient(colors: [backgroundColorStart ?? .white, backgroundColorEnd ?? .white]), startPoint: backgroundPointStart ?? .top, endPoint: backgroundPointEnd ?? .bottom))
		} else {
			EmptyView()
		}
	}


	private var cornerRadius: Double {
		let defaultRadius: Double

		switch buttonType {
		case .primary:
			defaultRadius = UI.Button.Primary.cornerRadius

		case .secondary:
			defaultRadius = UI.Button.Secondary.cornerRadius

		case .tertiary:
			defaultRadius = 0
		}
		return CommonUI.shared.buttonStyles[buttonType]?.cornerRadius ?? defaultRadius
	}

	private var padding: Double {
		let defaultPadding: Double

		switch buttonType {
		case .primary:
			defaultPadding = UI.Button.Primary.padding

		case .secondary:
			defaultPadding = UI.Button.Secondary.padding

		case .tertiary:
			defaultPadding = 0
		}

		return CommonUI.shared.buttonStyles[buttonType]?.padding ?? defaultPadding
	}

	private var borderColorStart: Color? {
		let defaultColor: Color?

		switch buttonType {
		case .primary:
			defaultColor = nil

		case .secondary:
			if isEnabled {
				defaultColor = UI.Button.Secondary.Enabled.Border.gradientColorStart
			} else {
				defaultColor = UI.Button.Secondary.Disabled.Border.gradientColorStart
			}

		case .tertiary:
			defaultColor = nil
		}

		if isEnabled {
			return CommonUI.shared.buttonStyles[buttonType]?.enabledBorderStyle?.gradientColorStart ?? defaultColor
		} else {
			return CommonUI.shared.buttonStyles[buttonType]?.disabledBorderStyle?.gradientColorStart ?? defaultColor
		}
	}

	private var borderColorEnd: Color? {
		let defaultColor: Color?

		switch buttonType {
		case .primary:
			defaultColor = nil

		case .secondary:
			if isEnabled {
				defaultColor = UI.Button.Secondary.Enabled.Border.gradientColorEnd
			} else {
				defaultColor = UI.Button.Secondary.Disabled.Border.gradientColorEnd
			}

		case .tertiary:
			defaultColor = nil
		}

		if isEnabled {
			return CommonUI.shared.buttonStyles[buttonType]?.enabledBorderStyle?.gradientColorEnd ?? defaultColor
		} else {
			return CommonUI.shared.buttonStyles[buttonType]?.disabledBorderStyle?.gradientColorEnd ?? defaultColor
		}
	}

	private var borderPointStart: UnitPoint? {
		let defaultPoint: UnitPoint?

		switch buttonType {
		case .primary:
			defaultPoint = nil

		case .secondary:
			if isEnabled {
				defaultPoint = UI.Button.Secondary.Enabled.Border.gradientPointStart
			} else {
				defaultPoint = UI.Button.Secondary.Disabled.Border.gradientPointStart
			}

		case .tertiary:
			defaultPoint = nil
		}

		if isEnabled {
			return CommonUI.shared.buttonStyles[buttonType]?.enabledBorderStyle?.gradientPointStart ?? defaultPoint
		} else {
			return CommonUI.shared.buttonStyles[buttonType]?.disabledBorderStyle?.gradientPointStart ?? defaultPoint
		}
	}

	private var borderPointEnd: UnitPoint? {
		let defaultPoint: UnitPoint?

		switch buttonType {
		case .primary:
			defaultPoint = nil

		case .secondary:
			if isEnabled {
				defaultPoint = UI.Button.Secondary.Enabled.Border.gradientPointEnd
			} else {
				defaultPoint = UI.Button.Secondary.Disabled.Border.gradientPointEnd
			}

		case .tertiary:
			defaultPoint = nil
		}

		if isEnabled {
			return CommonUI.shared.buttonStyles[buttonType]?.enabledBorderStyle?.gradientPointEnd ?? defaultPoint
		} else {
			return CommonUI.shared.buttonStyles[buttonType]?.disabledBorderStyle?.gradientPointEnd ?? defaultPoint
		}
	}

	private var borderThickness: Double {
		let defaultThickness: Double

		switch buttonType {
		case .primary:
			defaultThickness = 0

		case .secondary:
			defaultThickness = UI.Button.Secondary.borderThickness

		case .tertiary:
			defaultThickness = 0
		}

		if isEnabled {
			return CommonUI.shared.buttonStyles[buttonType]?.enabledBorderStyle?.thickness ?? defaultThickness
		} else {
			return CommonUI.shared.buttonStyles[buttonType]?.disabledBorderStyle?.thickness ?? defaultThickness
		}
	}

	private var backgroundColorStart: Color? {
		let defaultColor: Color?

		switch buttonType {
		case .primary:
			if isEnabled {
				defaultColor = UI.Button.Primary.Enabled.Background.gradientColorStart
			} else {
				defaultColor = UI.Button.Primary.Disabled.Background.gradientColorStart
			}

		case .secondary:
			defaultColor = .white

		case .tertiary:
			defaultColor = nil
		}

		if isEnabled {
			return CommonUI.shared.buttonStyles[buttonType]?.enabledBackgroundStyle?.gradientColorStart ?? defaultColor
		} else {
			return CommonUI.shared.buttonStyles[buttonType]?.disabledBackgroundStyle?.gradientColorStart ?? defaultColor
		}
	}

	private var backgroundColorEnd: Color? {
		let defaultColor: Color?

		switch buttonType {
		case .primary:
			if isEnabled {
				defaultColor = UI.Button.Primary.Enabled.Background.gradientColorEnd
			} else {
				defaultColor = UI.Button.Primary.Disabled.Background.gradientColorEnd
			}
		case .secondary:
			defaultColor = .white

		case .tertiary:
			defaultColor = nil
		}

		if isEnabled {
			return CommonUI.shared.buttonStyles[buttonType]?.enabledBackgroundStyle?.gradientColorEnd ?? defaultColor
		} else {
			return CommonUI.shared.buttonStyles[buttonType]?.disabledBackgroundStyle?.gradientColorEnd ?? defaultColor
		}
	}

	private var backgroundPointStart: UnitPoint? {
		let defaultPoint: UnitPoint?

		switch buttonType {
		case .primary:
			if isEnabled {
				defaultPoint = UI.Button.Primary.Enabled.Background.gradientPointStart
			} else {
				defaultPoint = UI.Button.Primary.Disabled.Background.gradientPointStart
			}

		case .secondary:
			defaultPoint = nil

		case .tertiary:
			defaultPoint = nil
		}

		if isEnabled {
			return CommonUI.shared.buttonStyles[buttonType]?.enabledBackgroundStyle?.gradientPointStart ?? defaultPoint
		} else {
			return CommonUI.shared.buttonStyles[buttonType]?.disabledBackgroundStyle?.gradientPointStart ?? defaultPoint
		}
	}

	private var backgroundPointEnd: UnitPoint? {
		let defaultPoint: UnitPoint?

		switch buttonType {
		case .primary:
			if isEnabled {
				defaultPoint = UI.Button.Primary.Enabled.Background.gradientPointEnd
			} else {
				defaultPoint = UI.Button.Primary.Disabled.Background.gradientPointEnd
			}

		case .secondary:
			defaultPoint = nil

		case .tertiary:
			defaultPoint = nil
		}

		if isEnabled {
			return CommonUI.shared.buttonStyles[buttonType]?.enabledBackgroundStyle?.gradientPointEnd ?? defaultPoint
		} else {
			return CommonUI.shared.buttonStyles[buttonType]?.disabledBackgroundStyle?.gradientPointEnd ?? defaultPoint
		}
	}

	private var labelColor: Color {
		let defaultColor: Color

		switch buttonType {
		case .primary:
			if isEnabled {
				defaultColor = UI.Button.Primary.Enabled.Label.color
			} else {
				defaultColor = UI.Button.Primary.Disabled.Label.color
			}

		case .secondary:
			if isEnabled {
				defaultColor = UI.Button.Secondary.Enabled.Label.color
			} else {
				defaultColor = UI.Button.Secondary.Disabled.Label.color
			}

		case .tertiary:
			if isEnabled {
				defaultColor = UI.Button.Tertiary.Enabled.Label.color
			} else {
				defaultColor = UI.Button.Tertiary.Disabled.Label.color
			}
		}

		if isEnabled {
			return CommonUI.shared.buttonStyles[buttonType]?.enabledLabelStyle.color ?? defaultColor
		} else {
			return CommonUI.shared.buttonStyles[buttonType]?.disabledLabelStyle.color ?? defaultColor
		}
	}

	private var labelStyle: Font {
		let defaultStyle: Font

		switch buttonType {
		case .primary:
			if isEnabled {
				defaultStyle = UI.Button.Primary.Enabled.Label.style
			} else {
				defaultStyle = UI.Button.Primary.Disabled.Label.style
			}

		case .secondary:
			if isEnabled {
				defaultStyle = UI.Button.Secondary.Enabled.Label.style
			} else {
				defaultStyle = UI.Button.Secondary.Disabled.Label.style
			}

		case .tertiary:
			if isEnabled {
				defaultStyle = UI.Button.Tertiary.Enabled.Label.style
			} else {
				defaultStyle = UI.Button.Tertiary.Disabled.Label.style
			}
		}

		if isEnabled {
			return CommonUI.shared.buttonStyles[.primary]?.enabledLabelStyle.style ?? defaultStyle
		} else {
			return CommonUI.shared.buttonStyles[.primary]?.disabledLabelStyle.style ?? defaultStyle
		}
	}

	private var labelWeight: Font.Weight {
		let defaultWeight: Font.Weight

		switch buttonType {
		case .primary:
			if isEnabled {
				defaultWeight = UI.Button.Primary.Enabled.Label.weight
			} else {
				defaultWeight = UI.Button.Primary.Disabled.Label.weight
			}

		case .secondary:
			if isEnabled {
				defaultWeight = UI.Button.Secondary.Enabled.Label.weight
			} else {
				defaultWeight = UI.Button.Secondary.Disabled.Label.weight
			}

		case .tertiary:
			if isEnabled {
				defaultWeight = UI.Button.Tertiary.Enabled.Label.weight
			} else {
				defaultWeight = UI.Button.Tertiary.Disabled.Label.weight
			}
		}

		if isEnabled {
			return CommonUI.shared.buttonStyles[.primary]?.enabledLabelStyle.weight ?? defaultWeight
		} else {
			return CommonUI.shared.buttonStyles[.primary]?.disabledLabelStyle.weight ?? defaultWeight
		}
	}

	private var progressViewColor: Color {
		let defaultColor: Color

		switch buttonType {
		case .primary:
			defaultColor = .white

		case .secondary:
			defaultColor = .green

		case .tertiary:
			defaultColor = .gray
		}

		return CommonUI.shared.buttonStyles[buttonType]?.progressViewColor ?? defaultColor
	}
}

#Preview("Enabled - No Progress") {
	ButtonView("Primary Button", buttonType: .primary, inProgress: .constant(false)) {
		print("tapped")
	}
	.disabled(false)
	.padding()
}
