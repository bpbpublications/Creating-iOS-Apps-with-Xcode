//
//  PickerView.swift
//  Household Chores
//
//  Created by Aaron L Bratcher on 8/9/23.
//

import SwiftUI

enum MemberChore: String, CaseIterable, Identifiable {
	case members = "Family Members"
	case chores = "Chores"
	var id: MemberChore { self }
}

struct MemberChorePicker: View {
	 @Binding var pickerSelection: MemberChore

	 var body: some View {
		  Picker(selection: $pickerSelection, label: EmptyView()) {
			  ForEach(MemberChore.allCases) { memberChore in
				  Text(memberChore.rawValue.localized).tag(memberChore.rawValue)
				}
		  }
		  .pickerStyle(.segmented)
		  .padding(.horizontal)
	 }
}

#Preview {
	MemberChorePicker(pickerSelection: .constant(.members))
}
