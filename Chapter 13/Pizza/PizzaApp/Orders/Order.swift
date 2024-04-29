//
//  Order.swift
//  PizzaApp
//
//  Created by Aaron L Bratcher on 12/17/23.
//

import Foundation
import Observation

public enum Cheese: String, CaseIterable {
	case none = "No cheese"
	case light = "Light cheese"
	case normal = "Normal cheese"
	case extra = "Extra cheese"
}

@Observable
public class Order: Identifiable {
	public let id = UUID()
	var entryTime: Date
	var crustStyle: String
	var crustSize: String
	var cheese: Cheese
	var meat: [String]
	var veggies: [String]

	public init(entryTime: Date = .now, crustStyle: String = "", crustSize: String = "", cheese: Cheese = .normal, meat: [String] = [], veggies: [String] = []) {
		self.entryTime = entryTime
		self.crustStyle = crustStyle
		self.crustSize = crustSize
		self.cheese = cheese
		self.meat = meat
		self.veggies = veggies
	}

	var toppings: String {
		let toppings: [String] = meat + veggies
		return toppings.joined(separator: ", ")
	}
}

#if DEBUG
extension Order {
	static var mock: [Order] {
		let order1 = Order(entryTime: Date.now, crustStyle: "Hand Tossed", crustSize: "12\"", cheese: .normal, meat: ["Ham"], veggies: ["Onion", "Pineapple"])
		let order2 = Order(entryTime: Date.now, crustStyle: "Deep Dish", crustSize: "16\"", cheese: .light, meat: ["Pepperoni", "Sausage"], veggies: ["Onion", "Mushroom", "Green Pepper", "Black Olive"])
		let order3 = Order(entryTime: .now, crustStyle: "Hand Tossed", crustSize:"18\"", cheese: .extra, meat: [], veggies: [])

		return [order1, order2, order3]
	}
}
#endif
