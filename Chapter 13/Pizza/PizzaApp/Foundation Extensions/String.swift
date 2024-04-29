//
//  String.swift
//  PizzaApp
//
//  Created by Aaron L Bratcher on 12/17/23.
//

import Foundation

extension String {
	var localized: String {
		Bundle.main.localizedString(forKey: self, value: nil, table: nil)
	}

	func localized(using values: CVarArg...) -> String {
		return String.localizedStringWithFormat(self.localized, values)
	}
}
