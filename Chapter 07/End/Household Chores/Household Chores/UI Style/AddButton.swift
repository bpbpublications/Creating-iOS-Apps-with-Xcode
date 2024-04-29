//
//  AddButton.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 8/31/23.
//

import SwiftUI

struct AddButton: View {
	let accessibilityText: LocalizedStringKey
	let action: () -> Void

	init(_ accessibilityText: LocalizedStringKey, action: @escaping () -> Void) {
		self.accessibilityText = accessibilityText
		self.action = action
	}

	var body: some View {
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
	AddButton("Tester") { }
}
