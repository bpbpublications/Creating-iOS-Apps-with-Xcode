//
//  TextStyles.swift
//  PizzaUI
//
//  Created by Aaron L Bratcher on 12/16/23.
//

import SwiftUI

extension Text {
	public func style(_ style: TextStyle, color: TextColor = .normal) -> Text {
		font(style.font)
			.foregroundStyle(FontUtility.shared.colorDefinition(for: color))
	}
}

public enum TextColor: String {
	case normal, subtle
}

public enum TextStyle: String, CaseIterable {
	case title, headline, subheadline, body, callout, caption, footnote

	var font: Font {
		return Font.custom(
			FontUtility.shared.fontInfo(for: self).font,
			size: FontUtility.shared.fontInfo(for: self).size,
			relativeTo: relativeStyle
		)
	}

	// so the text will grow as defined in accessibility
	var relativeStyle: Font.TextStyle {
		switch self {
		case .title:
			return Font.TextStyle.title
		case .headline:
			return Font.TextStyle.headline
		case .subheadline:
			return Font.TextStyle.subheadline
		case .body:
			return Font.TextStyle.body
		case .callout:
			return Font.TextStyle.callout
		case .caption:
			return Font.TextStyle.caption
		case .footnote:
			return Font.TextStyle.footnote
		}
	}
}

#Preview {
	VStack {
		Text("Title")
			.style(.title)

		Text("Headline")
			.style(.headline, color: .subtle)

		Text("Subheadline")
			.style(.subheadline)

		Text("Body")
			.style(.body)

		Text("Callout")
			.style(.callout)

		Text("Caption")
			.style(.caption)

		Text("Footnote")
			.style(.footnote)
	}
}
