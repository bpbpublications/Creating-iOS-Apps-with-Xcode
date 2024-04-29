//
//  UI Constants.swift
//  CommonUI
//
//  Created by Aaron Bratcher on 7/19/23.
//

import Foundation
import SwiftUI

public typealias Action = () -> Void

enum UI {
	enum Card {
		static var cornerRadius = 6.0
		static let bodyPadding = 8.0
		static let backgroundColor = Color.white
		static let borderColor = Color.black
		static let borderThickness = 1.0
		static let headerIconLeadingSpace = 16.0
		static let headerDividerColor = Color.gray
		static let headerPadding = 8.0
	}
	
	enum Text {
		enum H1 {
			static let font = "Arial Black"
			static let size = 36.0
			static let style = Font.TextStyle.largeTitle
		}

		enum H2 {
			static let font = "Arial Black"
			static let size = 24.0
			static let style = Font.TextStyle.headline
		}

		enum Paragraph {
			static let font = "Avenir Light"
			static let size = 16.0
			static let style = Font.TextStyle.body
		}
		
		enum Footer {
			static let font = "Avenir Medium"
			static let size = 12.0
			static let style = Font.TextStyle.footnote
		}
	}

	enum Button {
		enum Primary {
			static let cornerRadius = 10.0
			static let padding = 12.0

			enum Enabled {
				enum Label {
					static let style = Font.body
					static let weight = Font.Weight.bold
					static let color = Color.white
				}
				
				enum Background {
					static let gradientColorStart = Color(red: 81 / 255, green: 128 / 255, blue: 75 / 255)
					static let gradientColorEnd = Color.mint
					static let gradientPointStart = UnitPoint.top
					static let gradientPointEnd = UnitPoint.bottom
				}
			}

			enum Disabled {
				enum Label {
					static let style = Font.body
					static let weight = Font.Weight.bold
					static let color = Color.gray
				}

				enum Background {
					static let gradientColorStart = Color(red: 81 / 255, green: 128 / 255, blue: 75 / 255)
					static let gradientColorEnd = Color(red: 81 / 255, green: 128 / 255, blue: 75 / 255)
					static let gradientPointStart = UnitPoint.top
					static let gradientPointEnd = UnitPoint.bottom
				}
			}
		}

		enum Secondary {
			static let cornerRadius = 6.0
			static let padding = 8.0
			static let borderThickness = 3.0

			enum Enabled {
				enum Label {
					static let style = Font.body
					static let weight = Font.Weight.bold
					static let color = Color(red: 81 / 255, green: 128 / 255, blue: 75 / 255)
				}

				enum Background {
					static let color = Color.white
				}

				enum Border {
					static let gradientColorStart = Color(red: 81 / 255, green: 128 / 255, blue: 75 / 255)
					static let gradientColorEnd = Color.mint
					static let gradientPointStart = UnitPoint.top
					static let gradientPointEnd = UnitPoint.bottom
				}
			}
			
			enum Disabled {
				enum Label {
					static let style = Font.body
					static let weight = Font.Weight.bold
					static let color = Color.gray
				}

				enum Background {
					static let color = Color(.systemGray6)
				}

				enum Border {
					static let gradientColorStart = Color(red: 81 / 255, green: 128 / 255, blue: 75 / 255)
					static let gradientColorEnd = Color(red: 81 / 255, green: 128 / 255, blue: 75 / 255)
					static let gradientPointStart = UnitPoint.top
					static let gradientPointEnd = UnitPoint.bottom
				}
			}
		}

		enum Tertiary {
			enum Enabled {
				enum Label {
					static let style = Font.footnote
					static let weight = Font.Weight.medium
					static let color = Color(red: 81 / 255, green: 128 / 255, blue: 75 / 255)
				}
			}

			enum Disabled {
				enum Label {
					static let style = Font.footnote
					static let weight = Font.Weight.medium
					static let color = Color.gray
				}
			}
		}
	}

	enum ProgressBars {
		static let indicatorHeight = 12.0
		static let indicatorPadding = 4.0
		static let indicatorBorderColor = Color.gray
		static let indicatorBorderThickness = 0.5
		static let cornerRadius = 3.0
		static let padding = 4.0
		static let borderWidth = 1.0
		static let borderColor = Color.gray
	}
}
