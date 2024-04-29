//
//  ButtonStyle.swift
//  CommonUI
//
//  Created by Aaron L Bratcher on 3/24/24.
//

import Foundation
import SwiftUI

public enum ButtonType: CaseIterable {
		case primary, secondary, tertiary
}

public struct ButtonStyle {
	public let cornerRadius: Double
	public let padding: Double
	public let progressViewColor: Color
	public let enabledLabelStyle: ButtonLabelStyle
	public let disabledLabelStyle: ButtonLabelStyle
	public let enabledBackgroundStyle: ButtonBackgroundStyle?
	public let disabledBackgroundStyle: ButtonBackgroundStyle?
	public let enabledBorderStyle: ButtonBorderStyle?
	public let disabledBorderStyle: ButtonBorderStyle?

	public init(cornerRadius: Double, padding: Double, progressViewColor: Color, enabledLabelStyle: ButtonLabelStyle , disabledLabelStyle: ButtonLabelStyle, enabledBackgroundStyle: ButtonBackgroundStyle?, disabledBackgroundStyle: ButtonBackgroundStyle?, enabledBorderStyle: ButtonBorderStyle?, disabledBorderStyle: ButtonBorderStyle?) {
		self.cornerRadius = cornerRadius
		self.padding = padding
		self.progressViewColor = progressViewColor
		self.enabledLabelStyle = enabledLabelStyle
		self.disabledLabelStyle = disabledLabelStyle
		self.enabledBackgroundStyle = enabledBackgroundStyle
		self.disabledBackgroundStyle = disabledBackgroundStyle
		self.enabledBorderStyle = enabledBorderStyle
		self.disabledBorderStyle = disabledBorderStyle
	}
}

public struct ButtonLabelStyle {
	public let style: Font
	public let weight: Font.Weight
	public let color: Color

	public init(style: Font, weight: Font.Weight, color: Color) {
		self.style = style
		self.weight = weight
		self.color = color
	}
}

public struct ButtonBackgroundStyle {
	public let gradientColorStart: Color
	public let gradientColorEnd: Color
	public let gradientPointStart: UnitPoint
	public let gradientPointEnd: UnitPoint

	public init(gradientColorStart: Color, gradientColorEnd: Color, gradientPointStart: UnitPoint = .top, gradientPointEnd: UnitPoint = .bottom) {
		self.gradientColorStart = gradientColorStart
		self.gradientColorEnd = gradientColorEnd
		self.gradientPointStart = gradientPointStart
		self.gradientPointEnd = gradientPointEnd
	}
}

public struct ButtonBorderStyle {
	public let thickness: Double
	public let gradientColorStart: Color
	public let gradientColorEnd: Color
	public let gradientPointStart: UnitPoint
	public let gradientPointEnd: UnitPoint

	public init(thickness: Double, gradientColorStart: Color, gradientColorEnd: Color, gradientPointStart: UnitPoint = .top, gradientPointEnd: UnitPoint = .bottom) {
		self.thickness = thickness
		self.gradientColorStart = gradientColorStart
		self.gradientColorEnd = gradientColorEnd
		self.gradientPointStart = gradientPointStart
		self.gradientPointEnd = gradientPointEnd
	}
}
