//
//  ScoreLineItem.swift
//  NY City Schools
//
//  Created by Aaron Bratcher on 9/20/23.
//

import SwiftUI
import CommonUI

struct ScoreCardLineItem: View {
	let title: LocalizedStringKey
	let value: Int?

    var body: some View {
		 HStack {
			 Text(title)
				 .style(.paragraph)
			 if let value{
				 Text("\(value)")
					 .style(.paragraph)
					 .bold()
			 } else {
				 Text("NA")
					 .style(.paragraph)
					 .bold()
			 }
		 }
    }
}

#Preview {
    ScoreCardLineItem(title: "Line item title:", value: 203)
}

#Preview("No Value") {
	 ScoreCardLineItem(title: "Line item title:", value: nil)
}
