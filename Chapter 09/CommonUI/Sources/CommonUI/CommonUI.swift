
import Foundation
import SwiftUI

public class CommonUI {
	static public let shared = CommonUI()

	public var delegate: CommonUIDelegate? {
		didSet {
			setStyleData()
		}
	}

	var cardStyle = CardStyle(cornerRadius: 6, bodyPadding: 8, backgroundColor: .white, borderColor: .black, borderThickness: 1, headerDividerColor: .gray, headerPadding: 8, titleFont: .headline, titleColor: .black, subtitleFont: .callout, subtitleColor: .gray)
	var fontStyles: [TextStyle: FontStyle] = [:]
	var buttonStyles: [ButtonType: ButtonStyle] = [:]

	private func setStyleData() {
		guard let delegate else { return }

		cardStyle = delegate.cardStyle

		for textStyle in TextStyle.allCases {
			fontStyles[textStyle] = delegate.fontStyle(for: textStyle)
		}

		for button in ButtonType.allCases {
			buttonStyles[button] = delegate.buttonStyle(for: button)
		}
	}
}
