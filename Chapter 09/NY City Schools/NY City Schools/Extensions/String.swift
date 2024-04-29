//
//  String.swift
//  NY City Schools
//
//  Created by Aaron Bratcher on 9/18/23.
//

import Foundation

extension String {
	var localized: String {
		Bundle.main.localizedString(forKey: self, value: nil, table: nil)
	}
}
