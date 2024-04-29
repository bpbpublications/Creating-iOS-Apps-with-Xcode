//
//  OrderView.swift
//  PizzaApp
//
//  Created by Aaron L Bratcher on 12/17/23.
//

import SwiftUI
import PizzaUI

struct OrderView: View {
	let order: Order
	@State var percentRemaining: Double

	init(order: Order) {
		self.order = order
		self._percentRemaining = .init(initialValue: 100.0)
	}

    var body: some View {
		 Card(inError: percentRemaining < 0.25) {
			 HStack(spacing: 0) {
				 HStack(alignment: .top, spacing: 0) {
					 Text(order.crustSize)
						 .style(.headline)
					 VStack(alignment: .leading, spacing: 4) {
						 Text(order.crustStyle)
							 .style(.headline)
						 Text(order.toppings)
							 .style(.body, color: .subtle)
						 Text(order.cheese.rawValue.localized)
							 .style(.body, color: .subtle)
						 ProgressBars(progress: percentRemaining)
							 .frame(height: 20)
					 }
					 .padding(.leading, 16)
				 }
				 Spacer()
			 }
		 }
		 .onReceive(AppUtility.shared.timer) { currentTime in
			 let elapsed = currentTime.timeIntervalSince(order.entryTime)
			 let percentRemaining = 1 - elapsed / AppUtility.shared.orderTime
			 self.percentRemaining = percentRemaining
		 }
    }
}

#Preview {
	OrderView(order: Order.mock[1])
}
