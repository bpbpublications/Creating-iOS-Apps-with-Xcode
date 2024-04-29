import UIKit

for index in 10..<40 {
	print(index)
}
for index in stride(from: 10, through: 40, by: 5) {
	print(index)
}
for name in ["Apple", "Amazon", "Oracle", "Facebook", "Microsoft"] {
	print(name)
}


var testValue = true

while !testValue {
	print("running some code")
}

repeat {
	print("running extra code")
} while !testValue


struct Book {
	let author: String?

	func promoteAuthor() {
		guard let author, !author.isEmpty else { return }
		print("\(author) is a great author!")
	}
}

let book = Book(author: "Aaron L Bratcher")
book.promoteAuthor()


struct Book2 {
	let author: String?
	var bigData: Data?

	mutating func promoteAuthor() {
		bigData = "This is a large data object".data(using: .utf8)
		defer {
			bigData = nil
			print("big data removed")
		}

      guard let author, !author.isEmpty else {
         print("author not specified")
         return
      }
		print("\(author) is a great author!")
	}
}

var book2 = Book2(author: "Aaron L Bratcher")
book2.promoteAuthor()
