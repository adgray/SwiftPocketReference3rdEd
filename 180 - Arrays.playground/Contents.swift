// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Arrays
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// var arrayName = [Type]()
var daysOfWeek = [String]()

var vertex = [Double](repeating: 0.0, count: 10)

var locos = ["Puffing Billy", "Thomas"]
let daysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 31, 31]
var primes = [1, 3, 5, 7, 11]

let v = vertex[5]

let vowels = ["A", "E", "I", "O", "U"]
let consonants = ["B", "C", "D", "F", "G", "H", "J" /* etc */]
var letters = vowels + consonants



// ------------------------------------------
// Accessing Array Elements
// ------------------------------------------

let days = daysPerMonth[5]

let daysPerNorthernSummerMonth = daysPerMonth[5...7]

daysPerMonth.first
daysPerMonth.last
primes.max()
vowels.max()
daysPerMonth.min()



// ------------------------------------------
// Array Properties
// ------------------------------------------

daysPerMonth.capacity
daysPerMonth.count
daysPerMonth.isEmpty



// ------------------------------------------
// Modifying a Mutable Array
// ------------------------------------------

primes.append(13)
primes.append(contentsOf: [17, 19])
primes += [23, 29]

primes[2] = 100
primes

primes[2...3] = [23, 29, 31]
primes

primes.insert(5, at:2)
primes.insert(contentsOf:[37, 41], at: primes.endIndex)
primes.remove(at: 3)
primes.removeLast()
primes.removeAll(keepingCapacity: true)

primes = [1, 3, 5, 7, 11, 17, 19, 23, 29, 31]
primes.removeFirst()
primes.removeLast()
primes.removeSubrange(4...6)
primes.replaceSubrange(2...3, with:[37, 41, 43])

primes.capacity
primes.reserveCapacity(200)
primes.capacity



func ascending (i: Int, j: Int) -> Bool {
    return i < j
}

func descending (i: Int, j: Int) -> Bool {
    return j < i
}

primes.sort()
primes.sort(by: descending)
primes.sort(by: { $0 < $1 })
primes
primes.sort(by: >)
primes




// ------------------------------------------
// Iterating Over Arrays
// ------------------------------------------

print ("\n-vowels")
for i in vowels {
    print (i)
}

print ("\n-locomotives dictionary")
for (index, value) in locos.enumerated() {
    print ("\(index): \(value)")
}



// ------------------------------------------
// Array Inherited Functionality
// ------------------------------------------

var names = ["John", "Zoe", "Laura", "albert", "Allen"]

names.contains("John")
names.contains("Lisa")

let matched = names.contains(where: { $0.characters.count > 4 })
matched

names.dropFirst(2)
names.dropLast(2)


var namesCopy = names
names.elementsEqual(namesCopy)
names.elementsEqual(namesCopy.sorted())

let aa1 = names.filter { $0.characters.count > 4 }
aa1

let arrOfArrays = [["Bill", "Fred"], ["Mary"]]
let flatArray = arrOfArrays.flatMap() { $0 }
flatArray

print ("\n-forEach")
names.forEach { print($0) }


if let pos1 = names.index(of: "Allen") {
    print ("Index of Allen is", pos1)
}

names
if let pos2 = names.index(where: { $0.hasPrefix("Zo") } ) {
    print ("Predicate matched element:", pos2)
}

names.joined(separator: "; ")

let aa2 = names.map { $0.hasPrefix("A") ? $0 : "*" + $0 }
aa2

let aa3 = names.prefix(2)

let aa4 = names.reduce("") { $0 + $1 }
aa4

let aa5 = names.reversed()
print ("\n-reverse")
aa5.forEach { print ($0) }

let aa6 = names.sorted() { $0<$1 }
aa6

let intArray = [5, 2, 0, 0, 0, 4, 5, 6, 0, 9, 0]
let aa7 = intArray.split(separator: 0)
let aa8 = intArray.split(separator: 0, maxSplits: 1)
let aa9 = intArray.split(separator: 0, omittingEmptySubsequences: false)

names.starts(with: ["John", "Zoe"])
names.starts(with:["Allen"])

let aa10 = names.suffix(2)




// ------------------------------------------
// Brigding between Array and NSArray
// ------------------------------------------

import Foundation
(locos as NSArray).write(toFile:"/tmp/someArray", atomically: true)
// open /tmp/someArray in a text editor to check what was written



// ------------------------------------------
// Slices
// ------------------------------------------

let someNames = names[1...3]
someNames.startIndex // returns 1 (not 0)
someNames.endIndex   // returns 4 (not 3)

// test index consistency
names[1]      // returns Zoe
someNames[1]  // returns Zoe

// test mutation causes copy
names[1] = "Fred"
names[1]
someNames[1]  // slice still returns Zoe

names.removeAll()
someNames // still returns original slice


// test sorting of a range
letters
letters[3...6].sort()
letters




