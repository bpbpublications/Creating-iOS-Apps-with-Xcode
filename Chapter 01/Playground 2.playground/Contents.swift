import UIKit

enum Crust {
	case thin
	case handTossed
	case deepDish
	case none
}

enum Sauce {
	case tomato, white, arrabbiata, none
}

let crust = Crust.handTossed
let sauce: Sauce
sauce = .tomato

enum Size: Int {
	case six = 6
	case twelve = 12
	case eighteen = 18
}

let size = Size.twelve
print(size.rawValue)

let size2 = Size(rawValue: 16)
print(size2?.rawValue ?? "unknown")

if size == .six {
	print("personal size")
}


enum Topping {
	case sausage(isSpicy: Bool, grade: String)
	case cheese, onion, mushroom, greenPepper
}


let topping: Topping = .sausage(isSpicy: true, grade: "hot")

switch topping {
case .cheese:
	print("add cheese")

case .sausage(let spicy, _):
	print("sausage is spicy: \(spicy)")
	print("how spicy isn’t unspecified")
case .greenPepper:
	fallthrough

case .onion, .mushroom:
	print("veggies!")

default:
	break
}


let waistSize = 32
switch waistSize {
case 0..<20:
	print("tiny")
case 20..<40:
	print("medium")
case 40...60:
	print("large")
default:
	print("not stocked")
}


let topping2: Topping = .sausage(isSpicy: true, grade: "hot")

if case .sausage = topping2 {
	print("some sort of sausage")
}

if case let .sausage(isSpicy, grade) = topping2 {
	print("is spicy: \(isSpicy) grade: \(grade)")
}


enum Preference {
	enum Color {
		static let blue = "Blue"
		static let green = "green"
		static let red = "red"
	}

	enum Length {
		static let small = 20
		static let medium = 35
		static let large = 60
	}

	enum Thickness {
		static let thin = 0.1
		static let normal = 0.25
		static let thick = 0.5
	}
}

let color = Preference.Color.green
let length = Preference.Length.medium
let thickness = Preference.Thickness.thin
