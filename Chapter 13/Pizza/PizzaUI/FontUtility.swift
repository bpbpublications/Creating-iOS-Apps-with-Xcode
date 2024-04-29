//
//  FontUtility.swift
//  PizzaUI
//
//  Created by Aaron L Bratcher on 12/16/23.
//

import UIKit
import SwiftUI

public class FontUtility {
	public static let shared = FontUtility()
	private let fontInfo: [String: FontInfo]

	struct FontInfo: Codable {
		let font: String
		let size: Double
	}

	private init() {
		guard let asset = NSDataAsset(name: "Text/Styles") else {
			fontInfo = [:]
			return
		}

		do {
			fontInfo = try JSONDecoder().decode([String: FontInfo].self, from: asset.data)
		} catch {
			fontInfo = [:]
		}
	}

	func fontInfo(for style: TextStyle) -> FontInfo {
		let info = fontInfo[style.rawValue.capitalized] ?? FontInfo(font: "Avenir Light", size: 36)
		return info
	}

	public func colorDefinition(for textColor: TextColor) -> Color {
		return Color("Text/\(textColor.rawValue.capitalized)")
	}
}
