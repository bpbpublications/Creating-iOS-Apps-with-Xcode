//
//  String.swift
//  NY City Schools
//
//  Created by Aaron L Bratcher on 9/18/23.
//

import Foundation

extension String {
	var localized: String {
		Bundle.main.localizedString(forKey: self, value: nil, table: nil)
	}

	func stripParentheticalText() -> String {
		 var string = self
		 if let leftIdx = string.firstIndex(of: "("), let rightIdx = string.firstIndex(of: ")") {
			  let sansParens = String(string.prefix(upTo: leftIdx) + string.suffix(from: string.index(after: rightIdx)))
			  string = sansParens
		 }

		 return string
	}
}
