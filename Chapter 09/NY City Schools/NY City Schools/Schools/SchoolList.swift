//
//  SchoolList.swift
//  NY City Schools
//
//  Created by Aaron Bratcher on 9/18/23.
//

import SwiftUI
import Observation
import CommonUI

struct SchoolList: View {
	@Bindable var viewModel = SchoolListViewModel()
	@State var scores: Scores? = nil
	@State private var sheetHeight: Double = .zero

	var body: some View {
		NavigationView {
			VStack {
				SearchBar(text: $viewModel.searchText)
				ScrollView {
					ForEach(viewModel.schools) { school in
						SchoolEntry(school: school, delegate: viewModel, scores: viewModel.scores(for: school)) { scores in
							self.scores = scores
						}
						.padding(.horizontal, 8)
					}
				}
			}
			.sheet(item: $scores) { scores in
				ScoreCard(scores: scores)
					.padding()
					.modifier(ViewHeight($sheetHeight))
					.presentationDetents([.height(sheetHeight), .medium])
			}
			.navigationTitle("schoolListView.title".localized)
		}
	}
}

struct InnerHeightPreferenceKey: PreferenceKey {
	static var defaultValue: CGFloat = .zero
	static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
		value = nextValue()
	}
}

#Preview {
	SchoolList()
}
