//
//  CommonUIDelegate.swift
//  CommonUI
//
//  Created by Aaron Bratcher on 8/14/23.
//

import Foundation
import SwiftUI

public struct CardStyle {
	public var cornerRadius: Double = UI.Card.cornerRadius
	public var bodyPadding: Double = UI.Card.bodyPadding
	public var backgroundColor: Color = UI.Card.backgroundColor
	public var borderColor: Color = UI.Card.borderColor
	public var borderThickness: Double = UI.Card.borderThickness
	public var headerDividerColor: Color = UI.Card.headerDividerColor
	public var headerPadding: Double = UI.Card.headerPadding
	public var titleFont: Font = .headline
	public var titleColor: Color = .black
	public var subtitleFont: Font = .callout
	public var subtitleColor: Color = .gray

	public init(cornerRadius: Double, bodyPadding: Double, backgroundColor: Color, borderColor: Color, borderThickness: Double, headerDividerColor: Color, headerPadding: Double, titleFont: Font, titleColor: Color, subtitleFont: Font, subtitleColor: Color) {
		self.cornerRadius = cornerRadius
		self.bodyPadding = bodyPadding
		self.backgroundColor = backgroundColor
		self.borderColor = borderColor
		self.borderThickness = borderThickness
		self.headerDividerColor = headerDividerColor
		self.headerPadding = headerPadding
		self.titleFont = titleFont
		self.titleColor = titleColor
		self.subtitleFont = subtitleFont
		self.subtitleColor = subtitleColor
	}
}

public struct FontStyle {
	public let name: String
	public let size: Double
	public let relativeStyle: Font.TextStyle

	public init(name: String, size: Double, relativeStyle: Font.TextStyle) {
		self.name = name
		self.size = size
		self.relativeStyle = relativeStyle
	}
}

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

public protocol CommonUIDelegate {
	func fontStyle(for style: TextStyle) -> FontStyle
	func buttonStyle(for type: ButtonType) -> ButtonStyle

	var cardStyle: CardStyle { get }
}
