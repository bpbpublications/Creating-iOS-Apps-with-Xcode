import UIKit

var greeting = "Hello, playground"


greeting = "Swift is easy"
var now = Date()
let isRunning = true
let maxLength = 256
let avgNumberOfChildren = 2.2


let maxToppings: Int
var useBox: Bool
maxToppings = 10
useBox = false


var dogNames = ["Daisy", "Caesar", "Luna"]
var dogAges = [2, 5, 7]

let firstDog = dogNames[0]

dogNames = ["Daisy", "Caesar", "Luna"]
dogNames.append("Ralph")
dogNames.insert("Sparky", at: 0)
dogNames.remove(at: 1)
let sortedNames = dogNames.sorted()


var stations = [2: "Shell", 16: "BP", 32: "Chevron"]
print(stations[2])


stations[55] = "Phillips 66"
stations[55] = "PetroChina"
stations.removeValue(forKey: 2)
let stationCount = stations.count
print(stations.keys)
print(stations.values)
stations = [:]


var partyGuests: Set<String> = []
partyGuests.insert("Aaron L Bratcher")
partyGuests.insert("Anne McCaffrey")
partyGuests.insert("Douglas Adams")
partyGuests.insert("Richard Castle")
print(partyGuests)
partyGuests.remove("Douglas Adams")
print(partyGuests)
let insertResults = partyGuests.insert("Richard Castle")
print(insertResults)


let someData: (String, String, String)
someData = ("first element", "second object", "third")

var moreData: (name: String, city: String)
moreData = ("Thomas", "New York City")
moreData = (name: "Roger", city: "Los Angeles")


let crust: String?
crust = "thin"

if let crust {
	print(crust)
}

if var crust {
	crust = "altered crust"
	print(crust)
}

let crustType = crust ?? ""


struct Pizza {
	let crust: String?
	let sauce: String
	let toppings: [String]
}

let pizza = Pizza(crust: nil, sauce: "tomato", toppings: ["onion", "green pepper", "mushroom", "black olive"])
print(pizza.toppings)


