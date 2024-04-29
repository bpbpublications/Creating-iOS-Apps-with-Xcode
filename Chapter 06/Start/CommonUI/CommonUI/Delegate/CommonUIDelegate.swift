//
//  CommonUIDelegate.swift
//  CommonUI
//
//  Created by Aaron L Bratcher on 3/24/24.
//

import Foundation

public protocol CommonUIDelegate: AnyObject {
	func fontStyle(for style: TextStyle) -> FontStyle
	func buttonStyle(for type: ButtonType) -> ButtonStyle

	var cardStyle: CardStyle { get }
}
