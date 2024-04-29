import UIKit

typealias Weight = Double
typealias FermentProcess = () -> Void

struct PizzaDough {
   let grams: Weight

   init(grams: Weight) {
      self.grams = grams
   }

   func ferment(process: FermentProcess) {
      process()
   }
}

let dough = PizzaDough(grams: 500)

let fermentProcess: FermentProcess = {
   print("saved function to ferment pizza dough")
}

dough.ferment(process: fermentProcess)

dough.ferment(process: {
   print("fermenting dough with weight of \(dough.grams) grams")
})

dough.ferment {
   print("fermenting more dough with weight of \(dough.grams) grams")
}

typealias BakeTechnique = (_ pizzaSize: Weight) -> Void

struct PizzaOven {
   let bake: BakeTechnique

   init(bake: @escaping BakeTechnique) {
      self.bake = bake
   }
}

let oven = PizzaOven { pizzaSize in
   print("baking pizza")
}

oven.bake(400)
