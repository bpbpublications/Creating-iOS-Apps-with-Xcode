//
//  TertiaryButton.swift
//  CommonUI
//
//  Created by Aaron Bratcher on 7/23/23.
//

import SwiftUI

public struct TertiaryButton: View {
	private let action: Action
	private let text: LocalizedStringKey

	public init(_ text: LocalizedStringKey, action: @escaping Action) {
		self.text = text
		self.action = action
	}

	public var body: some View {
		ButtonView(text, buttonType: .tertiary, inProgress: .constant(false), action: action)
	}
}


#Preview("Tertiary enabled") {
	TertiaryButton("Tertiary Button") {
		print("tertiary clicked")
	}
}

#Preview("Tertiary disabled") {
	TertiaryButton("Tertiary Button") {
		print("tertiary clicked")
	}
	.disabled(true)
}
