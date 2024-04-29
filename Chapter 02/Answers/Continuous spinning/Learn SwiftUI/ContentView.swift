//
//  ContentView.swift
//  Learn SwiftUI
//
//  Created by Aaron Bratcher on 6/23/23.
//

import SwiftUI

struct ContentView: View {
	@State private var isAnimating = false
	@State private var offset: Double = 0
	@State private var isLoading = false

	var body: some View {
		VStack(spacing: 100) {
			Text("This is rotated text")
				.rotationEffect(Angle(radians: isAnimating ? -0.3 : 0.3))

			Text("Tap Here")
				.bold()
				.font(.title3)
				.padding(8)
				.overlay {
					RoundedRectangle(cornerRadius: 6)
						.stroke(Color.blue, style: StrokeStyle(lineWidth: 2))
				}
				.offset(x: offset)
				.onTapGesture {
					withAnimation(.snappy) {
						if offset > 100 {
							offset = 0
						} else {
							offset += 20
						}
					}
				}

			Circle()
				.stroke(Color.green)
				.frame(width: 30, height: 30)
				.scaleEffect(isAnimating ? 2.0 : 1.0)
				.onAppear {
					withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
						isAnimating = true
					}
				}

			Text(Image(systemName: "arrow.triangle.2.circlepath"))
				.foregroundStyle(Color.orange)
				.font(.title)
				.rotationEffect(Angle.degrees(isLoading ? 360 : 0))
				.onAppear {
					withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: false)) {
						isLoading = true
					}
				}
		}
	}
}

#Preview {
	ContentView()
}
