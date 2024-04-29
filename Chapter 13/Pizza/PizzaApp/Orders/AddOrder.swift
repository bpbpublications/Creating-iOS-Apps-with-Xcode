//
//  AddOrder.swift
//  PizzaApp
//
//  Created by Aaron L Bratcher on 12/17/23.
//

import SwiftUI
import PizzaUI

struct AddOrder: View {
	@Binding var showingSheet: Bool
	var addOrderDelegate: AddsOrders

	@State var order = Order(
		crustStyle: AppUtility.shared.crustStyles[0],
		crustSize: AppUtility.shared.crustSizes[0],
		cheese: .normal
	)
	@State var addingMeat = false
	@State var addingVeggie = false

	var body: some View {
		Card {
			header
			divider
				.padding(.top, -8)
			VStack(alignment: .leading, spacing: 0) {
				crust
				cheese
				meat
				vegetables
			}
			.frame(maxWidth: .infinity)
		}
		.padding()
	}

	@ViewBuilder
	var crust: some View {
		HStack {
			Text("Crust")
				.style(.headline)
			Spacer()
		}
		HStack {
			Picker("", selection: $order.crustStyle) {
				ForEach(AppUtility.shared.crustStyles, id: \.self) { style in
					Text(style)
						.style(.callout)
						.tag(style)
				}
			}
			Picker("", selection: $order.crustSize) {
				ForEach(AppUtility.shared.crustSizes, id: \.self) { size in
					Text(size)
						.style(.callout)
						.tag(size)
				}
			}
		}
		.padding(.leading, 16)
	}

	@ViewBuilder
	var cheese: some View {
		Text("Cheese")
			.style(.headline)

		HStack {
			Picker("", selection: $order.cheese) {
				ForEach(Cheese.allCases, id: \.self) { amount in
					Text(amount.rawValue.localized)
						.style(.callout)
						.tag(amount)
				}
			}
			Spacer()
		}
		.padding(.leading, 16)
	}

	@ViewBuilder
	var meat: some View {
		HStack {
			Text("Meat")
				.style(.headline)
			Spacer()
			AddButton("Add Meat") {
				addingMeat = true
			}
		}
		.popover(isPresented: $addingMeat) {
			VStack {
				Text("Select meat to add")
					.style(.subheadline)

				List(AppUtility.shared.meat, id: \.self) { meat in
					Text(meat)
						.style(.callout)
						.onTapGesture {
							order.meat.append(meat)
							addingMeat.toggle()
						}
				}
			}
			.frame(minWidth: 200, minHeight: 300)
			.padding()
		}

		if order.meat.isEmpty {
			Text("No Meat")
				.style(.caption)
				.padding(.leading, 16)
		} else {
			List {
				ForEach(order.meat, id: \.self) { meat in
					Text(meat)
						.style(.body)
						.listRowBackground(Color.clear)

				}
				.onDelete { indexSet in
					order.meat.remove(atOffsets: indexSet)
				}
			}
			.padding(.leading, 16)
		}
	}

	@ViewBuilder
	var vegetables: some View {
		HStack {
			Text("Veggies")
				.style(.headline)
			Spacer()
			AddButton("Add Veggie") {
				addingVeggie = true
			}
		}
		.popover(isPresented: $addingVeggie) {
			VStack {
				Text("Select veggie to add")
					.style(.subheadline)

				List(AppUtility.shared.veggies, id: \.self) { veggie in
					Text(veggie)
						.style(.callout)
						.onTapGesture {
							order.veggies.append(veggie)
							addingVeggie.toggle()
						}
				}
			}
			.frame(minWidth: 200, minHeight: 300)
			.padding()
		}
		if order.veggies.isEmpty {
			Text("No Veggies")
				.style(.caption)
				.padding(.leading, 16)
		} else {
			List {
				ForEach(order.veggies, id: \.self) { veggie in
					Text(veggie)
						.style(.body)
						.listRowBackground(Color.clear)
				}
				.onDelete { indexSet in
					order.veggies.remove(atOffsets: indexSet)
				}
			}
			.padding(.leading, 16)
		}
	}

	var divider: some View {
		Divider()
			.frame(height: 1.0)
			.overlay(.gray)
	}

	var header: some View {
		HStack {
			Button("Cancel") {
				showingSheet.toggle()
			}
			Spacer()
			Text("New Order".localized)
				.style(.headline, color: .subtle)
			Spacer()
			Button("Save") {
				order.entryTime = .now
				addOrderDelegate.addOrder(order)
				showingSheet.toggle()
			}
		}
	}
}

struct AddOrder_Previews: PreviewProvider {
	class OrderDelegate: AddsOrders {
		func addOrder(_ order: Order) { }
	}

	static var previews: some View {
		AddOrder(showingSheet: .constant(true), addOrderDelegate: OrderDelegate())
	}
}
