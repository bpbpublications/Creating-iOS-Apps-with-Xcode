//
//  DisclosureCard.swift
//  CommonUI
//
//  Created by Aaron Bratcher on 7/19/23.
//

import SwiftUI

public struct DisclosureCard<Content: View>: View {
	private let title: String
	private let subTitle: String?
	@State private var showingDetails: Bool
	private let detailContent: Content

	public init(title: String,
					subTitle: String? = nil,
					showingDetails: Bool = false,
					@ViewBuilder detailContent: () -> Content
	) {
		self.title = title
		self.subTitle = subTitle
		self._showingDetails = State(wrappedValue: showingDetails)
		self.detailContent = detailContent()
	}

	public var body: some View {
		VStack(alignment: .center, spacing: 0) {
			DisclosureCardHeader(title: title, subTitle: subTitle, showingDetails: $showingDetails)
			if showingDetails {
				Divider()
					.frame(height: UI.Card.borderThickness)
					.overlay(UI.Card.headerDividerColor)
					.padding(.bottom, UI.Card.headerPadding)

				detailContent
					.frame(maxWidth: .infinity, alignment: .center)
					.padding([.bottom, .leading, .trailing], UI.Card.bodyPadding)
			}
		}
		.background(
			RoundedRectangle(cornerRadius: UI.Card.cornerRadius)
				.stroke(UI.Card.borderColor, lineWidth: UI.Card.borderThickness)
				.background(UI.Card.backgroundColor)
		)
		.clipShape(RoundedRectangle(cornerRadius: UI.Card.cornerRadius))
	}
}

#Preview("Simple disclosing call") {
	ZStack {
		Color.cyan
		DisclosureCard(title: "Information – tap here") {
			VStack {
				Image(systemName: "figure.run")
			}
		}
		.padding()
	}
}

#Preview("With subtitle") {
	ZStack {
		Color.cyan
		DisclosureCard(title: "Information", subTitle: "Click for more details") {
			VStack {
				Image(systemName: "figure.run")
			}
		}
		.padding()
	}
}

#Preview("Showing details") {
	ZStack {
		Color.cyan
		DisclosureCard(title: "Information", subTitle: "Click for more details", showingDetails: true) {
			VStack {
				Image(systemName: "figure.run")
			}
		}
		.padding()
	}
}
