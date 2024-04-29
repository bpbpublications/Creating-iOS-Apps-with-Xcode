//
//  ContentView.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 7/25/23.
//

import SwiftUI

struct ContentView: View {
	@State private var membersOrChores: MemberChore = .members
	@AppStorage("showCompleted") var showCompleted = false
	@AppStorage("showPastDue") var showPastDue = false

	var body: some View {
		switch membersOrChores {
		case .members:
			MemberSplitView(membersOrChores: $membersOrChores)
		case .chores:
			ChoreSplitView(membersOrChores: $membersOrChores, showCompleted: showCompleted, showPastDue: showPastDue)
		}
	}
}

#Preview {
	ContentView()
}
