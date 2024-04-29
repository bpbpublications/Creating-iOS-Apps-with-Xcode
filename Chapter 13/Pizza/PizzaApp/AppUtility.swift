//
//  OrderUtility.swift
//  PizzaApp
//
//  Created by Aaron L Bratcher on 12/17/23.
//

import UIKit

typealias Seconds = Double

class AppUtility {
	static let shared = AppUtility()
	
	let crustSizes: [String]
	let crustStyles: [String]
	let meat: [String]
	let veggies: [String]
	let orderTime: Seconds

	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

	init() {
		if let crustSizesAsset = NSDataAsset(name: "Crust/Sizes") {
			do {
				crustSizes = try JSONDecoder().decode([String].self, from: crustSizesAsset.data)
			} catch {
				crustSizes = []
			}
		} else {
			crustSizes = []
		}

		if let crustStylesAsset = NSDataAsset(name: "Crust/Styles") {
			do {
				crustStyles = try JSONDecoder().decode([String].self, from: crustStylesAsset.data)
			} catch {
				crustStyles = []
			}
		} else {
			crustStyles = []
		}

		if let meatAsset = NSDataAsset(name: "Toppings/Meat") {
			do {
				meat = try JSONDecoder().decode([String].self, from: meatAsset.data)
			} catch {
				meat = []
			}
		} else {
			meat = []
		}

		if let veggiesAsset = NSDataAsset(name: "Toppings/Veggies") {
			do {
				veggies = try JSONDecoder().decode([String].self, from: veggiesAsset.data)
			} catch {
				veggies = []
			}
		} else {
			veggies = []
		}

		#if DEBUG
		orderTime = 15
		#else
		if let timeAsset = NSDataAsset(name: "Timer/Time") {
			do {
				let time = try JSONDecoder().decode([String: Seconds].self, from: timeAsset.data)
				orderTime = time["seconds"] ?? 900
			} catch {
				orderTime = 900
			}
		} else {
			orderTime = 900
		}
		#endif
	}
}
