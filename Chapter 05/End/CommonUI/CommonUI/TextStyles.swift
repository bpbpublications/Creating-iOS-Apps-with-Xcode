//
//  TextStyles.swift
//  CommonUI
//
//  Created by Aaron Bratcher on 7/20/23.
//

import SwiftUI

extension Text {
	public func style(_ style: TextStyle, color: Color = .black) -> Text {
		font(style.font)
			.foregroundStyle(color)
	}
}

public enum TextStyle: CaseIterable {
	case h1, h2, paragraph, footer

	var font: Font {
		let name = CommonUI.shared.fontStyles[self]?.name ?? fontName
		let size = CommonUI.shared.fontStyles[self]?.size ?? fontSize
		let relativeStyle = CommonUI.shared.fontStyles[self]?.relativeStyle ?? textStyle

		return Font.custom(name, size: size, relativeTo: relativeStyle)
	}

	var fontName: String {
		switch self {
		case .h1:
			return UI.Text.H1.font
		case .h2:
			return UI.Text.H2.font
		case .paragraph:
			return UI.Text.Paragraph.font
		case .footer:
			return UI.Text.Footer.font
		}
	}

	var fontSize: Double {
		switch self {
		case .h1:
			return UI.Text.H1.size
		case .h2:
			return UI.Text.H2.size
		case .paragraph:
			return UI.Text.Paragraph.size
		case .footer:
			return UI.Text.Footer.size
		}
	}

	// so the text will grow as defined in accessibility
	var textStyle: Font.TextStyle {
		switch self {
		case .h1:
			return UI.Text.H1.style
		case .h2:
			return UI.Text.H2.style
		case .paragraph:
			return UI.Text.Paragraph.style
		case .footer:
			return UI.Text.Footer.style
		}
	}
}

struct TextStyles: View {
	var body: some View {
		VStack {
			Text("Header")
				.style(.h1)

			Text("paragraph")
				.style(.paragraph, color: .orange)

			Text("Footer")
				.style(.footer, color: .secondary)
		}
	}
}

#Preview {
	TextStyles()
}
