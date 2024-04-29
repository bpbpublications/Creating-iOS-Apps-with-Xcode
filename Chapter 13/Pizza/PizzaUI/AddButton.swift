//
//  AddButton.swift
//  PizzaUI
//
//  Created by Aaron L Bratcher on 12/17/23.
//

import SwiftUI

public struct AddButton: View {
	let accessibilityText: LocalizedStringKey
	let action: () -> Void

	public init(_ accessibilityText: LocalizedStringKey, action: @escaping () -> Void) {
		self.accessibilityText = accessibilityText
		self.action = action
	}

	public var body: some View {
		Button {
			action()
		} label: {
			Image(systemName: "plus.circle.fill")
				.resizable()
				.tint(Color.green)
				.frame(width: 25, height: 25)
				.accessibility(label: Text(accessibilityText))
		}
	}
}

#Preview {
	AddButton("Add Order") {}
}
