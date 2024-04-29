//
//  ContentView.swift
//  Learn SwiftUI
//
//  Created by Aaron Bratcher on 6/23/23.
//

import SwiftUI

struct ContentView: View {
   @State private var customers = ["Michael Jackson", "John Lennon", "Johnny Cash", "Frank Sinatra", "Jimi Hendrix"]

   var body: some View {
      NavigationView {
         List {
            ForEach(customers, id: \.self) { customer in
               Text(customer)
            }
            .onDelete { indexSet in
              indexSet.forEach { index in
                customers.remove(at: index)
               }
            }
            .onMove { indices, newOffset in
              customers.move(fromOffsets: indices, toOffset: newOffset)
            }
         }
         .navigationBarTitle(Text("Customers"))
         .toolbar {
             EditButton()
         }
      }
   }
}

#Preview {
   ContentView()
}
