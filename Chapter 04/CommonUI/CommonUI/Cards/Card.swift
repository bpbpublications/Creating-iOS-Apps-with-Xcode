//
//  Card.swift
//  CommonUI
//
//  Created by Aaron Bratcher on 7/19/23.
//

import SwiftUI

public struct Card<Content: View>: View {
	private let content: Content

	public init(@ViewBuilder content: () -> Content) {
		self.content = content()
	}

	public var body: some View {
		VStack(alignment: .center, spacing: 0) {
			content
				.padding(UI.Card.bodyPadding)
		}
		.frame(maxWidth: .infinity)
		.background(
			RoundedRectangle(cornerRadius: UI.Card.cornerRadius)
				.stroke(UI.Card.borderColor, lineWidth: UI.Card.borderThickness)
				.background(UI.Card.backgroundColor)
				.clipShape(RoundedRectangle(cornerRadius: UI.Card.cornerRadius))
		)
	}
}

#Preview {
	ZStack {
		Color.cyan
		Card() {
			HStack {
				Image(systemName: "figure.run")
					.foregroundColor(.black)
				Text("Body of the card")
					.foregroundColor(.black)
			}
		}
		.padding()
	}
}
