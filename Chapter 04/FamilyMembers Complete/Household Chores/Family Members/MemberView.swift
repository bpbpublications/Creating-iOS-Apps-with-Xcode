//
//  MemberView.swift
//  Household Chores
//
//  Created by Aaron Bratcher on 7/30/23.
//

import SwiftUI
import CommonUI

struct MemberView: View {
	@Binding var member: FamilyMember

	var body: some View {
		Card {
			Form {
				Section("Name") {
					TextField("Name", text: $member.name)
				}

				Section("Chores") {
					List(member.chores) { chore in
						Text(chore.name)
					}
				}

			}
			.frame(maxHeight: 400)
			.padding(-6)
		}
		.padding()
	}
}

struct MemberView_Previews: PreviewProvider {
	static var previews: some View {
		MemberView(member: .constant(FamilyMember()))
			.previewLayout(.sizeThatFits)
	}
}

