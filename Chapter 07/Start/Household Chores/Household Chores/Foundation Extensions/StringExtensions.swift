//
//  StringExtensions.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 8/9/23.
//

import Foundation

extension String {
	var localized: String {
		Bundle.main.localizedString(forKey: self, value: nil, table: nil)
	}
}
