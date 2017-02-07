// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Sets
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------



#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



var aSet = Set<Int>()
var compassPoints = Set<String>()
compassPoints = ["North", "South", "East", "West"]

var vowels = Set<Character>(minimumCapacity: 5)

var chessMaster: Set = ["King", "Queen", "Rook", "Bishop", "Knight", "Pawn"]
var chessPieces = chessMaster
var chessTemp = chessMaster

var fish: Set = ["Cod", "Flathead", "Shark"]
var mammals: Set = ["Dolphin", "Whale", "Dugong"]
var protected: Set = ["Shark", "Whale", "Dugong", "Dolphin"]




// -------------------------------------
// Comparing Sets
// -------------------------------------

chessPieces == chessMaster
fish == mammals
fish != mammals




// -------------------------------------
// Accessing Set Items and Properties
// -------------------------------------

chessPieces.contains("Prince")
chessPieces.contains("King")
chessPieces.count
chessPieces.isEmpty
vowels.isEmpty




// -------------------------------------
// Modifying a Mutable Set
// -------------------------------------

chessPieces = chessMaster
chessPieces.formIntersection(["King", "Queen"])


chessPieces.insert("Rook")
chessPieces.formSymmetricDifference(chessMaster)

chessPieces.formUnion(["Rook", "King", "Queen"])

chessPieces.remove("Pawn")
chessPieces.remove("undefinedPiece")


chessPieces = chessMaster
chessPieces.removeAll()
// with an empty set, the next line will cause a runtime error
// chessPieces.removeFirst()


chessPieces = chessMaster
let item = chessPieces.removeFirst()
chessPieces
chessPieces.insert(item)
chessPieces.removeFirst()
chessPieces


chessPieces.subtract(["Rook", "Pawn", "Queen"])




// -------------------------------------
// Iterating Over Sets
// -------------------------------------

print ("\n-iterating over a set's elements")
for piece in chessPieces.sorted().reversed() {
    print (piece)
}


print ("\n-iterating over a set's elements using indices")
for i in chessPieces.indices {
    print (chessPieces[i])
}



// -------------------------------------
// Set Operations
// -------------------------------------

let allSeaCreatures = fish.union(mammals)
let unprotectedSeaCreatures = allSeaCreatures.symmetricDifference(protected)


let protectedMammals = mammals.intersection(protected)
let protectedFish = fish.intersection(protected)


fish.isDisjoint(with: mammals) // should be true - fish aren't mammals


mammals.isStrictSubset(of: protected) // should be true - all mammals should be protected


protected.isStrictSuperset(of: mammals) // should be true - mammals + others should be protected
protected.isStrictSuperset(of: fish) // should be false - not all fish are protected


mammals.isSubset(of: protected) // should be true - mammals + others should be protected
fish.isSubset(of: protected) // should be false - not all fish are protected
unprotectedSeaCreatures.isSubset(of: fish) // should be true from earlier exor


allSeaCreatures.isSuperset(of: fish) // should be true from earlier union


let protectedFish1 = protected.subtracting(mammals) // should just leave protected fish




// -------------------------------------
// Set Inherited Functionality
// -------------------------------------

print ("\n-iterating over a set with forEach")
chessPieces.forEach { print ($0) }


var removed: String = ""
if let someIndex = chessPieces.index(of: "King") {
    removed = chessPieces.remove(at: someIndex)
}
chessPieces
removed


print ("\n-iterating over a set by index")
for var i in chessPieces.indices {
    print (chessPieces[i])
}


let reversed1 = chessMaster.reversed()
reversed1


let reversed2 = chessMaster.sorted(by: <)
reversed2


let sorted = chessMaster.sorted{ $0 > $1 }
sorted





// -------------------------------------
// Option Sets
// -------------------------------------

struct TextStyle: OptionSet {
    let rawValue: UInt8
    
    static let bold      = TextStyle(rawValue: 1)
    static let italic    = TextStyle(rawValue: 2)
    static let underline = TextStyle(rawValue: 4)
    static let outline   = TextStyle(rawValue: 8)
}

var style: TextStyle = []
style = [.bold, .italic]
style.insert(TextStyle.underline)
style.remove(.bold)
if style.contains(.outline) {
    // do something
}



