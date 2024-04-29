//
//  ContentView.swift
//  Learn SwiftUI
//
//  Created by Aaron Bratcher on 6/23/23.
//

import SwiftUI

enum GlobeImage: String, CaseIterable {
   case globe
   case americas = "globe.americas"
   case europeAfrica = "globe.europe.africa"
   case asiaAustralia = "globe.asia.australia"
   case centralSouthAsia = "globe.central.south.asia"
}

extension GlobeImage: Identifiable {
   var id: GlobeImage {
      self
   }
}

extension GlobeImage: CustomStringConvertible {
   var description: String {
      switch self {
      case .globe: return "Wire Globe"
      case .americas: return "Americas"
      case .europeAfrica: return "Europe - Africa"
      case .asiaAustralia: return "Asia - Australia"
      case .centralSouthAsia: return "Central South Asia"
      }
   }
}


struct ContentView: View {
   @State private var imageSize: Double = 50
   @State private var showImage: Bool = true
   @State private var greeting: String = "Hello, world!"
   let imageNames = ["globe", "globe.americas", "globe.europe.africa", "globe.asia.australia", "globe.central.south.asia"]
   @State private var imageIndex: Int = 0
   @State private var image: GlobeImage = .globe
   @State private var date: Date = Date()

   var body: some View {
      VStack {
         DatePicker(selection: $date, displayedComponents: [.date]) {
            Text("Target Date")
         }
         .datePickerStyle(.graphical)

         Toggle(isOn: $showImage) {
               Text("Show Image")
         }

         if showImage {
//            Picker(selection: $imageIndex, label: Text("Globe Image")) {
//               ForEach(0..<imageNames.count, id: \.self) { index in
//                  Text(imageNames[index])
//               }
//            }

            Picker(selection: $image, label: Text("Globe Image")) {
               ForEach(GlobeImage.allCases) { image in
                  Text(String(describing: image))
               }
            }
            .pickerStyle(.wheel)
         }

         TextField(text: $greeting) {
            Text("Enter greeting here")
         }
         	.padding(6)
            .overlay(
               RoundedRectangle(cornerRadius: 4)
                  .stroke(Color.purple, lineWidth: 1)
            )

         HStack {
            Text(greeting)
               .bold()
               .font(.title)
               .foregroundStyle(Color(.darkGray))

            if showImage {
               Image(systemName: image.rawValue)
                  .resizable()
                  .foregroundStyle(.tint)
                  .frame(width: imageSize, height: imageSize)
            }
         }

         if showImage {
            Slider(value: $imageSize, in: 25...50, step: 5)
            Stepper(value: $imageSize, in: 25...50, step: 1) {
               Text("Image Size")
                  .bold()
            }
         }

      }
      .padding()
   }
}


#Preview {
   ContentView()
}
