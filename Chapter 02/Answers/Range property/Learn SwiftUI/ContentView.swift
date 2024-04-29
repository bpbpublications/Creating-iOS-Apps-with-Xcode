//
//  ContentView.swift
//  Learn SwiftUI
//
//  Created by Aaron Bratcher on 6/23/23.
//

import SwiftUI

struct ContentView: View {
   @State private var imageSize: Double = 50
   @State private var showImage: Bool = true
	let stepRange: ClosedRange<Double> = 25...50

	var body: some View {
		VStack {
			Image(systemName: "globe")
				.resizable()
				.foregroundStyle(Color.green)
				.frame(width: imageSize, height: imageSize)
			
			Slider(value: $imageSize, in: stepRange, step: 5)
			Stepper(value: $imageSize, in: stepRange, step: 1) {
				Text("Image Size")
					.bold()
			}
		}
		.padding()
   }
}

#Preview {
   ContentView()
}
