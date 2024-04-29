import SwiftUI
import PlaygroundSupport
import CommonUI

struct Images: View {
	@State private var isFavorite = false
	@State private var loadingResource = false

	var body: some View {
		VStack(spacing: 24) {
			Button(action: {
				print("hello")
			}) {
				Text("link button")
			}

			Button(action: {
				print("hello")
			}) {
				Text("Hello World")
					.bold()
					.foregroundColor(.white)
					.font(.title)
					.padding()
					.background(Color.mint)
					.padding(10)
					.border(Color.red, width: 5)
					.padding(10)
					.border(Color.blue, width: 5)
			}


			Button(action: {
				print("hello")
			}) {
				Text("Tap Me")
					.foregroundColor(.black)
					.fontWeight(.bold)
					.font(.title)
					.padding()
					.frame(maxWidth: .infinity)
					.foregroundColor(.white)
					.overlay(
						RoundedRectangle(cornerRadius: 5)
							.stroke(Color.gray, lineWidth: 2)
					)
			}

			Button(action: {
				isFavorite.toggle()
			}) {
				Image(systemName: "heart")
					.font(.largeTitle)
					.symbolVariant(isFavorite ? .fill : .none)
			}

			Button(action: {
				isFavorite.toggle()
			}) {
				HStack {
					Image(systemName: "heart")
						.font(.largeTitle)
						.symbolVariant(isFavorite ? .fill : .none)
					Text("Mark Favorite")
						.font(.headline)
						.fontWeight(.heavy)
						.foregroundStyle(Color.gray)
				}
				.padding(8)
				.overlay(
					RoundedRectangle(cornerRadius: 5)
						.stroke(Color.mint, lineWidth: 2)
				)
			}

			Button(action: {
				isFavorite.toggle()
			}) {
				Label("Favorite", systemImage: "heart")
					.symbolVariant(isFavorite ? .fill : .none)
					.font(.callout)
					.fontWeight(.medium)
				.padding(8)
				.overlay(
					RoundedRectangle(cornerRadius: 5)
						.stroke(Color.mint, lineWidth: 2)
				)
			}

			Button(action: {
				loadingResource.toggle()
			}) {
				HStack {
					if loadingResource {
						ProgressView()
							.tint(.white)
					} else {
						Text("Load Resource")
							.bold()
					}
				}
				.frame(minWidth: 0, maxWidth: .infinity)
				.padding(12)
				.foregroundColor(.white)
				.background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.mint]), startPoint: .top, endPoint: .bottom))
				.cornerRadius(40)
			}
				.disabled(loadingResource)

			Text("Header style")
				.style(TextStyle.h1, color: .orange)
		}
			.padding()
	}

}

PlaygroundPage.current.setLiveView(Images())
