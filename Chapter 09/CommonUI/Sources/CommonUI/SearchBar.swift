import SwiftUI

public struct SearchBar: View {
	@Binding var text: String

	@State private var isEditing = false
	@FocusState private var searchTextFocused: Bool

	public init(text: Binding<String>) {
		self._text = text
	}

	public var body: some View {
		HStack {
			TextField("search.defaultText".localized, text: $text)
				.padding(7)
				.padding(.horizontal, 25)
				.padding(.leading, 8)
				.background(Color(.systemGray6))
				.cornerRadius(8)
				.padding(.horizontal, 10)
				.onTapGesture {
					self.isEditing = true
				}
				.focused($searchTextFocused)
				.overlay(
					HStack {
						Image(systemName: "magnifyingglass")
							.foregroundColor(.gray)
							.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
							.padding(.leading, 8)

						if isEditing {
							Button(action: {
								self.text = ""
							}) {
								Image(systemName: "multiply.circle.fill")
									.foregroundColor(.gray)
									.padding(.trailing, 8)
							}
						}
					}.padding()
				)

			if isEditing {
				Button(action: {
					self.isEditing = false
					self.searchTextFocused = false
				}) {
					Image(systemName: "keyboard.chevron.compact.down")
				}
				Button(action: {
					self.isEditing = false
					self.text = ""
					self.searchTextFocused = false

				}) {
					Text("search.cancel".localized)
				}
				.padding(.trailing, 10)
				.transition(.move(edge: .trailing))
			}
		}
	}
}

struct SearchBar_Previews: PreviewProvider {
	static var previews: some View {
		SearchBar(text: .constant(("")))
	}
}
