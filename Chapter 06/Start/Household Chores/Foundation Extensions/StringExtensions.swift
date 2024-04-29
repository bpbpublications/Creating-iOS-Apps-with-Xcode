//
//  StringExtensions.swift
//  Household Chores
//
//  Created by Aaron Bratcher on 8/9/23.
//

import Foundation

extension String {
	var localized: String {
		return String(format: NSLocalizedString(self, comment: ""))
	}
}
