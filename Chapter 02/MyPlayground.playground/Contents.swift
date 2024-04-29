import SwiftUI
import PlaygroundSupport

struct Images: View {
	@State private var isFavorite = false
	@State private var population = 1.0
	@State private var isTalking = false

	var body: some View {
		VStack(spacing: 32) {
			Image(systemName: "heart")
				.symbolRenderingMode(.palette)
				.resizable()
				.foregroundStyle(.red, .mint, .mint)
				.symbolVariant(isFavorite ? .circle : .circle.fill)
				.symbolEffect(.bounce, options: .repeat(2), value: isFavorite)
				.font(.system(size: 100))
				.aspectRatio(contentMode: .fit)
				.onTapGesture {
					isFavorite.toggle()
				}

			Image(systemName: "person.3.sequence", variableValue: population)
				.imageScale(.large)
				.font(.largeTitle)
				.foregroundStyle(.red, .mint, .orange)
				.padding(.bottom, -32)

			Slider(value: $population)

			Image(systemName: "ellipsis.message")
				.symbolEffect(.variableColor.iterative.dimInactiveLayers.nonReversing, isActive: isTalking)
				.imageScale(.large)
				.font(.largeTitle)
				.foregroundStyle(.red, .mint, .orange)
				.onTapGesture {
					isTalking.toggle()
				}
		}
		.padding()
		.frame(width: 300)

		
	}
}

PlaygroundPage.current.setLiveView(Images())
