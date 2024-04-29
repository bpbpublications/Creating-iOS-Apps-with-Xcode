//
//  Buttons.swift
//  CommonUI
//
//  Created by Aaron Bratcher on 7/23/23.
//

import SwiftUI

public struct SecondaryButton: View {
	private let action: Action
	private let text: LocalizedStringKey
	@Binding var inProgress: Bool

	public init(_ text: LocalizedStringKey, inProgress: Binding<Bool>, action: @escaping Action) {
		self.text = text
		self._inProgress = inProgress
		self.action = action
	}

	public var body: some View {
		ButtonView(text, buttonType: .secondary, inProgress: $inProgress, action: action)
	}
}

#Preview("Enabled - No Progress") {
	SecondaryButton("Secondary Button", inProgress: .constant(false)) {
		print("tapped")
	}
	.disabled(false)
	.padding()
}

#Preview("Enabled - Progress") {
	SecondaryButton("Secondary Button", inProgress: .constant(true)) {
		print("tapped")
	}
	.disabled(false)
	.padding()
}

#Preview("Disabled - No Progress") {
	SecondaryButton("Secondary Button", inProgress: .constant(false)) {
		print("tapped")
	}
	.disabled(true)
	.padding()
}

#Preview("Disabled - Progress") {
	SecondaryButton("Secondary Button", inProgress: .constant(true)) {
		print("tapped")
	}
	.disabled(true)
	.padding()
}
