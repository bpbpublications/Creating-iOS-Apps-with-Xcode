//
//  TertiaryButton.swift
//  CommonUI
//
//  Created by Aaron Bratcher on 7/23/23.
//

import SwiftUI

struct TertiaryButton: View {
	private let action: Action
	private let text: LocalizedStringKey
	@Environment(\.isEnabled) private var isEnabled

	private var labelColor: Color {
		if isEnabled {
			return UI.Button.Tertiary.Enabled.Label.color
		} else {
			return UI.Button.Tertiary.Disabled.Label.color
		}
	}

	private var labelStyle: Font {
		if isEnabled {
			return UI.Button.Tertiary.Enabled.Label.style
		} else {
			return UI.Button.Tertiary.Disabled.Label.style
		}
	}

	private var labelWeight: Font.Weight {
		if isEnabled {
			return UI.Button.Tertiary.Enabled.Label.weight
		} else {
			return UI.Button.Tertiary.Disabled.Label.weight
		}
	}

	public init(_ text: LocalizedStringKey, action: @escaping Action) {
		self.text = text
		self.action = action
	}
    var body: some View {
		 Button(action: {
			 action()
		 }) {
			 Text(text)
				 .foregroundStyle(labelColor)
				 .font(labelStyle)
				 .fontWeight(labelWeight)
		 }
    }
}

#Preview("Tertiary enabled") {
	TertiaryButton("Tertiary Button Enabled") {
		print("tertiary clicked")
	}
}

#Preview("Tertiary disabled") {
	TertiaryButton("Tertiary Button Disbled") {
		print("tertiary clicked")
	}
	.disabled(true)
}
