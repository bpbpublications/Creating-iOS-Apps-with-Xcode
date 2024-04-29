// Create a variable that holds an array of optional strings
print("Contributors:")
let contributorNames: [String?] = ["Arthur C Clarke", nil, "Isaac Asimov"]
for name in contributorNames {
	print(name)
}

print("\n\nCaptains:")
// Create a variable that holds a dictionary with an integer key and an optional tuple of two strings
let captains: [Int: (String, String)?] = [1773: ("Nathaniel", "Bowditch"), 1668: ("Thomas","Coram"), 1966: nil]
for (key, value) in captains {
	print("\(key): \(value)")
}


// Alter the Pizza struct to use enumerations instead of strings
enum Crust {
	case thin
	case handTossed
	case deepDish
	case none
}

enum Sauce {
	case tomato, white, arrabbiata, none
}

enum SpicyGrade {
	case mild, medium, hot
}

enum Topping {
	case sausage(isSpicy: Bool, grade: SpicyGrade)
	case cheese, onion, mushroom, greenPepper
}

struct Pizza {
	var crust: Crust
	var sauce: Sauce
	var toppings: [Topping] = []

	init(crust: Crust = .none, sauce: Sauce = .tomato, toppings: [Topping]) {
		self.crust = crust
		self.sauce = sauce
		self.toppings = toppings
	}
}

let pizza = Pizza(toppings: [.cheese, .greenPepper, .mushroom, .onion, .sausage(isSpicy: true, grade: .medium)])


// Alter the BakeTechnique to return number of minutes required to bake and use it in the PizzaOven struct
typealias Weight = Double
typealias Minutes = Int
typealias BakeTechnique = (_ pizzaSize: Weight) -> Minutes

struct PizzaOven {
   let bake: BakeTechnique

   init(bake: @escaping BakeTechnique) {
      self.bake = bake
   }
}

let oven = PizzaOven { pizzaSize in
   print("baking pizza")
   return 10
}

let minutes = oven.bake(400)
print("it took \(minutes) minutes to bake")

