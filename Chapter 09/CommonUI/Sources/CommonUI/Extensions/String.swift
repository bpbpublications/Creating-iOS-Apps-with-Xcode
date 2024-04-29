//
//  Strng.swift
//
//
//  Created by Aaron Bratcher on 9/16/23.
//

import Foundation

extension String {
	var localized: String {
		Bundle.module.localizedString(forKey: self, value: nil, table: nil)
	}
}
