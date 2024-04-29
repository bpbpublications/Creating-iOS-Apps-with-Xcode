//
//  CardStyle.swift
//  CommonUI
//
//  Created by Aaron L Bratcher on 3/24/24.
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
