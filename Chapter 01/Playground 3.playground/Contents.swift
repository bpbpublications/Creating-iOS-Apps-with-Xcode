import UIKit

class Map {
	func canMove(_ player: Player, to position: CGPoint) -> Bool {
		return true
	}
}

class Player {
	var numberOfLives: Int
	var positionOnMap: CGPoint

	init() {
		numberOfLives = 3
		positionOnMap = .zero
	}

	init(numberOfLives: Int, positionOnMap: CGPoint) {
		self.numberOfLives = numberOfLives
		self.positionOnMap = positionOnMap
	}

	func moveTo(_ position: CGPoint) -> Bool {
		positionOnMap = position
		return true
	}
}

class Soldier: Player {
	private var numberOfMoves: Int = 0

	override func moveTo(_ position: CGPoint) -> Bool {
		if numberOfMoves < 5 {
			positionOnMap = position
			numberOfMoves += 1
			return true
		} else {
			return false
		}
	}
}

let map = Map()
let player1 = Player()
let player2: Player = Soldier(numberOfLives: 5, positionOnMap: CGPoint(x: 20, y: 5))

var position = CGPoint(x: 1, y: 2)
var didMove: Bool = false
if map.canMove(player1, to: position) {
	didMove = player1.moveTo(position)
}
print("player 1 did move: \(didMove)")


position = CGPoint(x: 20, y: 6)
didMove = false
if map.canMove(player2, to: position) {
	didMove = player2.moveTo(position)
}
print("player 2 did move: \(didMove)")

print(player1.positionOnMap)
print(player2.positionOnMap)


if let soldier = player2 as? Soldier {
	print("Yes, sir!")
}

if player2 is Soldier {
	print("I'm a soldier")
}


let player3 = player2
player3.numberOfLives = 5
print("player3 lives: \(player3.numberOfLives)")
print("player2 lives: \(player2.numberOfLives)")


struct Gamer {
	var numberOfLives = 0
}

var gamer1 = Gamer()
gamer1.numberOfLives = 3
var gamer2 = gamer1
gamer2.numberOfLives = 10
print("gamer1 lives: \(gamer1.numberOfLives)")
print("gamer2 lives: \(gamer2.numberOfLives)")


protocol UsesFuel {
	var fuelType: String { get }
	var percentRemaining: Double { get set }
}


extension UsesFuel {
	mutating func consumeFuel(percent: Double) {
		percentRemaining -= percent
	}
}

protocol Flies {
	var prefilghtComplete: Bool { get }
	func performPreflight()
}

struct Lawnmower: UsesFuel {
	var fuelType: String {
		"Gas"
	}
	var percentRemaining: Double = 0.85
}

class SemiTruck: UsesFuel {
	var fuelType: String {
		"Diesel"
	}
	var percentRemaining: Double = 0.20
}

class ElectricCar: UsesFuel {
	var fuelType: String {
		"Electricity"
	}
	var percentRemaining: Double = 0.50
}

class Jet: UsesFuel, Flies {
	var prefilghtComplete: Bool = false
	var fuelType: String {
		"Jet Fuel"
	}
	var percentRemaining: Double = 1

	func performPreflight() {
		prefilghtComplete = true
	}
}

var lawnmower = Lawnmower()
lawnmower.consumeFuel(percent: 0.10)
print(lawnmower.percentRemaining)

let jet = Jet()
jet.performPreflight()
print(jet.prefilghtComplete)


class Hangar {
	func repairPlane(plane: Flies) {
		print("plane repaired")
	}
}

let hangar = Hangar()
hangar.repairPlane(plane: jet)
