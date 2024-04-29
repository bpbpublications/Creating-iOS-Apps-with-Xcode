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
					.frame(height: CommonUI.shared.cardStyle.borderThickness)
					.overlay(CommonUI.shared.cardStyle.borderColor)
					.padding(.bottom, CommonUI.shared.cardStyle.headerPadding)

				detailContent
					.frame(maxWidth: .infinity, alignment: .center)
					.padding([.bottom, .leading, .trailing], CommonUI.shared.cardStyle.bodyPadding)
			}
		}
		.background(
			RoundedRectangle(cornerRadius: CommonUI.shared.cardStyle.cornerRadius)
				.stroke(UI.Card.borderColor, lineWidth: CommonUI.shared.cardStyle.borderThickness )
				.background(CommonUI.shared.cardStyle.backgroundColor)
		)
		.clipShape(RoundedRectangle(cornerRadius: CommonUI.shared.cardStyle.cornerRadius))
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
