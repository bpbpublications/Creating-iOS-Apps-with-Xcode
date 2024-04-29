//
//  SchoolList.swift
//  NY City Schools
//
//  Created by Aaron L Bratcher on 9/18/23.
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
				 switch viewModel.loadingStatus {
				 case .complete:
					 schoolList
				 case .loading:
					loading
				 case .error:
					 error
				 }
			}
			.navigationTitle("schoolListView.title".localized)
			.onAppear {
				Task {
					await viewModel.downloadData()
				}
			}
		}
	}

	var schoolList: some View {
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
	}
	
	var loading: some View {
		VStack {
			 ProgressView()
				  .progressViewStyle(.circular)
				  .scaleEffect(2)
				  .padding()
			 Text("schoolListView.loading".localized)
				.style(.h2)
		}
	}

	@ViewBuilder
	var error: some View {
		Image(systemName: "exclamationmark.triangle")
			 .resizable()
			 .renderingMode(.template)
			 .foregroundColor(.red)
			 .frame(width: 32, height: 32)
		Text("schoolListView.error".localized)
			.style(.h2)
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
