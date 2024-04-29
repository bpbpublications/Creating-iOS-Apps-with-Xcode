//
//  OrderList.swift
//  PizzaApp
//
//  Created by Aaron L Bratcher on 12/17/23.
//

import SwiftUI
import PizzaUI

protocol AddsOrders {
	func addOrder(_ order: Order)
}

public struct OrderList: View {
	@State var orders: [Order]
	@State var showSheet: Bool = false

	public init(orders: [Order] = []) {
		self._orders = .init(initialValue: orders)
	}

    public var body: some View {
		 NavigationView {
			 List {
				 ForEach(orders) { order in
					 OrderView(order: order)
						 .listRowSeparator(.hidden)
						 .listRowBackground(Color.clear)
				 }
				 .onDelete { indexSet in
					 orders.remove(atOffsets: indexSet)
				 }
			 }
			 .padding(.horizontal, -16)
			 .toolbar {
				 AddButton("Add Order") {
					 showSheet = true
				 }
			 }
			 .navigationTitle("Orders".localized)
		 }
		 .sheet(isPresented: $showSheet) {
			 AddOrder(showingSheet: $showSheet, addOrderDelegate: self)
				 .interactiveDismissDisabled(true)
		 }
    }
}

extension OrderList: AddsOrders {
	func addOrder(_ order: Order) {
		print("adding order")
		orders.append(order)
	}
}

#Preview {
	OrderList(orders: Order.mock)
}
