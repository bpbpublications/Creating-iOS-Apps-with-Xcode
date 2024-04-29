//
//  FontStyle.swift
//  CommonUI
//
//  Created by Aaron L Bratcher on 3/24/24.
//

import Foundation
import SwiftUI

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
