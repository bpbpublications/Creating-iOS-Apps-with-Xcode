//
//  Card.swift
//  PizzaUI
//
//  Created by Aaron L Bratcher on 12/15/23.
//

import SwiftUI

public struct Card<Content: View>: View {
	private let content: Content
	private let inError: Bool

	public init(inError: Bool = false, @ViewBuilder content: () -> Content) {
		self.content = content()
		self.inError = inError
	}

	public var body: some View {
		VStack(alignment: .center, spacing: 0) {
			content
				.padding(8)
		}
		.frame(maxWidth: .infinity)
		.background(
			RoundedRectangle(cornerRadius: 8)
				.stroke(Color.black,
						  lineWidth: 1)
				.background(backgroundColor)
				.clipShape(RoundedRectangle(cornerRadius: 8))
				.shadow(color: .gray, radius: 2, x: 0.5, y: 1)
		)
	}

	var backgroundColor: Color {
		if inError {
			return Color("Card/Background-Error")
		} else {
			return Color("Card/Background")
		}
	}
}

#Preview("Normal") {
	ZStack {
		Card() {
			HStack {
				Image(systemName: "figure.run")
					.foregroundColor(.black)
				Text("Body of the card")
					.foregroundColor(Color("Text/Normal"))
			}
		}
		.padding()
	}
}

#Preview("Error") {
	ZStack {
		Card(inError: true) {
			HStack {
				Image(systemName: "figure.run")
					.foregroundColor(.black)
				Text("Body of the card")
					.foregroundColor(Color("Text/Normal"))
			}
		}
		.padding()
	}
}
