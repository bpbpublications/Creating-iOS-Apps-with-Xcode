//
//  ContentView.swift
//  Learn SwiftUI
//
//  Created by Aaron Bratcher on 6/23/23.
//

import SwiftUI

struct ContentView: View {
   @State private var greeting: String = "Hello, world!"

	var body: some View {
		VStack {
			VStack(alignment: .leading, spacing: 0) {
				TextField(text: $greeting) {
					Text("Enter greeting here")
				}
				.padding(6)
				.overlay(
					RoundedRectangle(cornerRadius: 4)
						.stroke(Color.purple, lineWidth: 1)
				)
				Text("World Greeting")
					.font(.footnote)
					.foregroundStyle(Color(.lightGray))
					.padding(.top, 2)
					.padding(.leading, 6)
			}

			HStack {
				Text(greeting)
					.bold()
					.font(.title)
					.foregroundStyle(Color(.darkGray))

				Image(systemName: "globe")
					.resizable()
					.foregroundStyle(Color.mint)
					.frame(width: 50, height: 50)
			}
		}
      .padding()
   }
}


#Preview {
   ContentView()
}
