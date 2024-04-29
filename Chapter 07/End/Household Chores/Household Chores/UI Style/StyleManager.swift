//
//  StyleManager.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 8/16/23.
//

import Foundation
import CommonUI

class StyleManager: CommonUIDelegate {
	init() {
		CommonUI.shared.delegate = self
	}

	func fontStyle(for style: TextStyle) -> FontStyle {
		switch style {
		case .h1:
			FontStyle(name: "Arial Black", size: 42, relativeStyle: .largeTitle)

		case .h2:
			FontStyle(name: "Arial", size: 28, relativeStyle: .headline)

		case .paragraph:
			FontStyle(name: "Baskerville", size: 18, relativeStyle: .body)

		case .footer:
			FontStyle(name: "Baskerville SemiBold", size: 12, relativeStyle: .caption)
		}
	}
	
	func buttonStyle(for type: ButtonType) -> ButtonStyle {
		switch type {
		case .primary:
			let enabledLabelStyle = ButtonLabelStyle(style: .body, weight: .bold, color: .white)
			let enabledBackgroundStyle = ButtonBackgroundStyle(gradientColorStart: .brandSecondary, gradientColorEnd: .blue)
			let disabledLablStyle = ButtonLabelStyle(style: .body, weight: .bold, color: .gray)
			let disabledBackgroundStyle = ButtonBackgroundStyle(gradientColorStart: .teal, gradientColorEnd: .teal)

			return ButtonStyle(cornerRadius: 0, padding: 8, progressViewColor: .white, enabledLabelStyle: enabledLabelStyle, disabledLabelStyle: disabledLablStyle, enabledBackgroundStyle: enabledBackgroundStyle, disabledBackgroundStyle: disabledBackgroundStyle, enabledBorderStyle: nil, disabledBorderStyle: nil)
		case .secondary:
			let enabledLabelStyle = ButtonLabelStyle(style: .body, weight: .bold, color: .blue)
			let enabledBorderStyle = ButtonBorderStyle(thickness: 2, gradientColorStart: .blue, gradientColorEnd: .blue)
			let disabledLablStyle = ButtonLabelStyle(style: .body, weight: .bold, color: .gray)
			let disabledBorderStyle = ButtonBorderStyle(thickness: 1, gradientColorStart: .gray, gradientColorEnd: .gray)

			return ButtonStyle(cornerRadius: 0, padding: 8, progressViewColor: .gray, enabledLabelStyle: enabledLabelStyle, disabledLabelStyle: disabledLablStyle, enabledBackgroundStyle: nil, disabledBackgroundStyle: nil, enabledBorderStyle: enabledBorderStyle, disabledBorderStyle: disabledBorderStyle)

		case .tertiary:
			let enabledLabelStyle = ButtonLabelStyle(style: .body, weight: .bold, color: .blue)
			let disabledLablStyle = ButtonLabelStyle(style: .body, weight: .bold, color: .gray)

			return ButtonStyle(cornerRadius: 0, padding: 0, progressViewColor: .gray, enabledLabelStyle: enabledLabelStyle, disabledLabelStyle: disabledLablStyle, enabledBackgroundStyle: nil, disabledBackgroundStyle: nil, enabledBorderStyle: nil, disabledBorderStyle: nil)
		}
	}
	
	var cardStyle: CardStyle {
		CardStyle(
			cornerRadius: 20,
			bodyPadding: 16,
			backgroundColor: .white,
			borderColor: .cyan,
			borderThickness: 3.0,
			headerDividerColor: .black,
			headerPadding: 8,
			titleFont: .headline,
			titleColor: .black,
			subtitleFont: .callout,
			subtitleColor: .gray
		)
	}
}
