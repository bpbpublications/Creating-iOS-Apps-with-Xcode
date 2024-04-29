//
//  ContentView.swift
//  Household Chores
//
//  Created by Aaron Bratcher on 7/25/23.
//

import SwiftUI

struct ContentView: View {
	@State private var membersOrChores: MemberChore = .members

	var body: some View {
		switch membersOrChores {
		case .members:
			MemberSplitView(membersOrChores: $membersOrChores)
		case .chores:
			ChoreSplitView(membersOrChores: $membersOrChores)
		}
	}
}

#Preview {
	ContentView()
}
