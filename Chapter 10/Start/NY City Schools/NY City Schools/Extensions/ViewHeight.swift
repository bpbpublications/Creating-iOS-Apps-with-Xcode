//
//  ViewHeight.swift
//  NY City Schools
//
//  Created by Aaron Bratcher on 9/20/23.
//

import SwiftUI

struct ViewHeight: ViewModifier {
	@Binding var height: Double

	init(_ height: Binding<Double>) {
		self._height = height
	}

	func body(content: Content) -> some View {
		content.background(
			GeometryReader { geometry -> Color in
				height = geometry.size.height
				return Color.clear
			}
		)
	}
}
