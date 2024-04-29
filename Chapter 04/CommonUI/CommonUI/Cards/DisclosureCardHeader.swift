//
//  DisclosureCardHeader.swift
//  CommonUI
//
//  Created by Aaron Bratcher on 7/19/23.
//

import SwiftUI

public struct DisclosureCardHeader: View {
	let title: String
	let subTitle: String?
	@Binding var showingDetails: Bool

	public init(title: String, subTitle: String? = nil, showingDetails: Binding<Bool>) {
		self.title = title
		self.subTitle = subTitle
		self._showingDetails = showingDetails
	}

	public var body: some View {
		HStack(spacing: 0) {
			VStack(alignment: .leading, spacing: 0) {
				Text(title)
					.font(.headline)
				if let subTitle {
					Text(subTitle)
						.font(.callout)
						.foregroundColor(.gray)
				}
			}
			Spacer(minLength: UI.Card.headerIconLeadingSpace)
			Image(systemName: "chevron.up")
				.frame(width: 36, height: 36)
				.rotationEffect(.degrees(showingDetails ? 180 : 0))
				.padding(.trailing, -UI.Card.headerPadding)
		}
		.padding(UI.Card.headerPadding)
		.contentShape(Rectangle())
		.onTapGesture {
			withAnimation {
				showingDetails.toggle()
			}
		}
	}
}

#Preview("Hiding details") {
    DisclosureCardHeader(title: "Tap for more", subTitle: "Tap here for more information", showingDetails: .constant(false))
}

#Preview("Showing details") {
	DisclosureCardHeader(title: "Tap for more", subTitle: "Tap here for more information", showingDetails: .constant(true))
}
