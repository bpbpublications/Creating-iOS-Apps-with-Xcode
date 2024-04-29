//
//  ContentView.swift
//  Learn SwiftUI
//
//  Created by Aaron Bratcher on 6/23/23.
//

import SwiftUI

struct ContentView: View {
	let destinations = ["Boston", "New York", "Philadelphia", "Chicago"]
   let trainDestinations = [12: "Boston", 104: "New York", 110: "Philadelphia", 126: "Chicago"]

   var body: some View {
      VStack(spacing: 24) {
         ScrollView(.horizontal) {
            HStack {
               ForEach(0..<1000, id: \.self) { index in
                  Text("\(index)")
                     .bold()
               }
            }
         }
         .padding(.bottom, 24)

         ScrollView {
            ForEach(destinations, id: \.self) { destination in
               Text(destination)
            }
         }
         .fixedSize(horizontal: false, vertical: true)
         .border(Color.green)

         ScrollView {
            ForEach(trainDestinations.sorted(by: <), id: \.key) { train, destination in
               Text("train #\(train) – \(destination)")
            }
         }
         .fixedSize(horizontal: false, vertical: true)
         .border(Color.red)

         ScrollView {
            ForEach(trainDestinations.keys.sorted(), id: \.self) { train in
               trainText(for: train)
            }
         }
         .fixedSize(horizontal: false, vertical: true)
         .border(Color.blue)
      }
   }

   @ViewBuilder
   func trainText(for train: Int) -> some View {
      if let destination = trainDestinations[train] {
         Text("train #\(train) – \(destination)")
      } else {
         EmptyView()
      }
   }
}

#Preview {
   ContentView()
}
