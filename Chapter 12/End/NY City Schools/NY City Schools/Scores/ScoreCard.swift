//
//  ScoreSheet.swift
//  NY City Schools
//
//  Created by Aaron L Bratcher on 9/20/23.
//

import SwiftUI
import CommonUI

struct ScoreCard: View {
	let scores: Scores

	var body: some View {
		Card {
			Text(scores.schoolName)
				.style(.h2)
				.padding(.top, 8)
				.fixedSize(horizontal: false, vertical: true)
				.accessibility(identifier: ScoreCardIdentifier.schoolName.rawValue)
			Divider()
			VStack {
				ScoreCardLineItem(title: "scoresView.takers", value: scores.numTakers)
				ScoreCardLineItem(title: "scoresView.reading", value: scores.readingAvgScore)
				ScoreCardLineItem(title: "scoresView.math", value: scores.mathAvgScore)
				ScoreCardLineItem(title: "scoresView.reading", value: scores.readingAvgScore)
				ScoreCardLineItem(title: "scoresView.writing", value: scores.writingAvgScore)
			}
			.padding(.bottom, 4)
		}
	}
}

#if DEBUG
#Preview {
	ScoreCard(scores: Scores.mockScores[0])
}
#endif
