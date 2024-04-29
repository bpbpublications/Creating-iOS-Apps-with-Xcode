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
				.padding(CommonUI.shared.cardStyle.bodyPadding)
		}
		.frame(maxWidth: .infinity)
		.background(
			RoundedRectangle(cornerRadius: CommonUI.shared.cardStyle.cornerRadius)
				.stroke(CommonUI.shared.cardStyle.borderColor,
						  lineWidth: CommonUI.shared.cardStyle.borderThickness)
				.background(CommonUI.shared.cardStyle.backgroundColor)
				.clipShape(RoundedRectangle(cornerRadius: CommonUI.shared.cardStyle.cornerRadius))
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
