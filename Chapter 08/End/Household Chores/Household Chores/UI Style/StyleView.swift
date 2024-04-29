//
//  StyleView.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 8/16/23.
//

import SwiftUI
import CommonUI

struct StyleView: View {
	let styleManager = StyleManager()

    var body: some View {
		 ScrollView {
			 Card {
				 VStack {
					 Text("H1")
						 .style(.h1)
					 Text("H2")
						 .style(.h2)
					 Text("Paragraph")
						 .style(.paragraph)
					 Text("Footer")
						 .style(.footer)
				 }
			 }

			 Card {
				 VStack {
					 PrimaryButton("Primary", inProgress: .constant(false)) { }
					 PrimaryButton("Primary", inProgress: .constant(true)) { }
					 PrimaryButton("Primary", inProgress: .constant(false)) { }
						 .disabled(true)
					 PrimaryButton("Primary", inProgress: .constant(true)) { }
						 .disabled(true)
				 }
			 }

			 Card {
				 VStack {
					 SecondaryButton("Secondary", inProgress: .constant(false)) { }
					 SecondaryButton("Secondary", inProgress: .constant(true)) { }
					 
					 SecondaryButton("Secondary", inProgress: .constant(false)) { }
						 .disabled(true)
					 SecondaryButton("Secondary", inProgress: .constant(true)) { }
						 .disabled(true)
				 }
			 }

			 Card {
				 VStack {
					 TertiaryButton("Tertiary") { }
					 TertiaryButton("Tertiary") { }
						 .disabled(true)
				 }
			 }

		 }
		 	.padding()
    }
}

#Preview {
    StyleView()
}
