//
//  ContentView.swift
//  Learn SwiftUI
//
//  Created by Aaron Bratcher on 6/23/23.
//

import SwiftUI

enum Crust: String {
   case thin, handTossed, deepDish, none
}

enum Sauce: String {
   case tomato, white, arrabbiata, none
}

enum Topping: String {
   case sausage, pepperoni, cheese, onion, mushroom, greenPepper
}

struct Pizza: Identifiable {
   let id = UUID()
   var crust: Crust
   var sauce: Sauce
   var toppings: [Topping]

   var toppingsDescription: String {
      toppings.map { $0.rawValue }.joined(separator: ", ")
   }

	#if DEBUG
   static func samplePizzas() -> [Pizza] {
      let p1 = Pizza(crust: .handTossed, sauce: .tomato, toppings: [.cheese, .pepperoni])
      let p2 = Pizza(crust: .none, sauce: .white, toppings: [.cheese, .mushroom, .onion, .greenPepper])
      let p3 = Pizza(crust: .thin, sauce: .arrabbiata, toppings: [.cheese, .sausage])
      return [p1, p2, p3]
   }
   #endif
}

struct OrderType: Identifiable {
   let id = UUID()
   var name: String
   var pizzas: [Pizza]

   #if DEBUG
   static func sampleOrderTypes(type: String) -> [OrderType] {
		return [OrderType(name: type, pizzas: Pizza.samplePizzas())]
   }
   #endif
}

struct Restaurant {
   var orderTypes: [OrderType]

   #if DEBUG
   static func sampleRestaurant() -> Restaurant {
      let ot1 = OrderType.sampleOrderTypes(type: "delivered")
      let ot2 = OrderType.sampleOrderTypes(type: "pickup")
      return Restaurant(orderTypes: ot1 + ot2)
   }
	#endif
}

struct ContentView: View {
   let restaurant = Restaurant.sampleRestaurant()

   var body: some View {
      NavigationView {
         List {
            ForEach(restaurant.orderTypes) { orderType in
               Section(header: headerText(for: orderType.name)) {
                  ForEach(orderType.pizzas) { pizza in
                     VStack(alignment: .leading) {
                        Text("Crust: \(pizza.crust.rawValue)")
                        Text("Sauce: \(pizza.sauce.rawValue)")
                        Text("Toppings: \(pizza.toppingsDescription)")
                     }
                  }
               }
            }
         }
         .navigationBarTitle(Text("Pizza Orders"))
      }
   }

   func headerText(for name: String) -> Text {
      Text(name)
         .bold()
         .font(.title3)
   }
}

#Preview {
   ContentView()
}
