// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Iterators, Sequences, Collections
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// ------------------------------------------
// Iterators
// ------------------------------------------
print ("ITERATOR Examples:")


// a simple integer sequence iterator
var state = 0
let intSeq = AnyIterator<Int> {
    defer { state += 1 }
    return state
}

intSeq.next()  // returns 0
intSeq.next()  // returns 1
intSeq.next()  // returns 2
state



// a simple integer sequence iterator
var intSeq2: AnyIterator<Int>

do {
    var n = 10  // the state, which will go out of scope
    intSeq2 = AnyIterator<Int> {
        defer { n += 1 }
        return n
    }
}

intSeq2.next()  // returns 10
intSeq2.next()  // returns 11
intSeq2.next()  // returns 12



// an iterator that produces multiples of 7, until 12*7 is reached
var stepState = 0
let stepBy7 = AnyIterator {
    () -> Int? in
        if (stepState < (12*7)) {
            stepState += 7
            return stepState
        }
        return nil
    }

let a = Array(stepBy7)


stepState = 0
let b = Array(stepBy7)


// produce times tables
func timesTable(_ which: Int) -> [Int]
{
    var i = 0
    return Array(AnyIterator<Int> {
        i += 1
        return i <= 12 ? i * which : nil
        } )
}

print (timesTable(1))
print (timesTable(2))
print (timesTable(5))




// ------------------------------------------
// Sequences
// ------------------------------------------
print ("\n\nSEQUENCE Examples:")

// a struct-based sequence

struct timesTable2 : Sequence
{
    var table: Int
    
    init(_ table: Int) {
        self.table = table
    }

    func makeIterator() -> AnyIterator<Int> {
        var state = 0
        return AnyIterator<Int>( {
            state += 1
            return state <= 12 ? state * self.table : nil
        } )
    }
}

print ("7 times table:")
let f = timesTable2(7)
for i in f {
    print (i, terminator: ", ")
}


print ("\n4 times table:")
for i in timesTable2(4) {
    print (i, terminator: ", ")
}

let c = timesTable2(3).map( {$0 * 2} ).filter( {$0 % 4 == 0 } )
c

timesTable2(9).contains(18)
timesTable2(9).contains(12)




// ------------------------------------------
// Collections
// ------------------------------------------

// a struct-based collection

struct timesTable3 : Collection
{
    var table: Int
    init(_ table: Int) { self.table = table }
    
    let startIndex = 1
    let endIndex = 13
    
    subscript(i: Int) -> Int {
        return i * self.table
    }
    
    func index(after i: Int) -> Int {
        return i+1
    }
}


print ("\n\nCOLLECTION Examples:")
print ("9 times table in reverse:")
let d = timesTable3(9).reversed()
print (d)

print ("\n8 times table:")
timesTable3(8).forEach( { print ($0, terminator: ", ") } )


print ("\n\nsubscripted access:")
print(timesTable3(6)[2])




// ------------------------------------------------------
// Indexed Access to Collections (using views of strings)
// ------------------------------------------------------

print ("\n\nindexed access:")

let shortString = "ab"

var si = shortString.utf8.startIndex
print (shortString.utf8[si])
si = shortString.utf8.index(after: si)
print (shortString.utf8[si])
si = shortString.utf8.index(after: si)
if (si == shortString.utf8.endIndex) { print ("now at end, as expected") }


let str = "Swift"
var i = str.utf8.startIndex
while (i != str.utf8.endIndex) {
    print (str.utf8[i], terminator: ", ")
    i = str.utf8.index(after: i)
}
print()



let seekY = Character("Y")
if let foundAt = "New York".characters.index(of: seekY) {
    // foundAt is the index of the matching "Y"
    print (seekY, "was found")
    
}




// ------------------------------------------------------
// Collection properties and methods
// ------------------------------------------------------

var aColl = timesTable(11)


aColl.count
// should return 12

aColl.distance(from:2, to:3)
// should return 1

aColl.dropFirst()
// returns sequence with 11 removed from the start

aColl.dropLast()
// returns sequence with 132 removed from the end

aColl.first
// should return 11

aColl.index(2, offsetBy: 2)
// should return 4

aColl.index(2, offsetBy: 4, limitedBy: aColl.endIndex)
// should return 6

aColl.index(10, offsetBy: 4, limitedBy: aColl.endIndex)
// should return nil

aColl.index(of: 9)
// should return nil

aColl.index(of: 22)
// should return 1

aColl.index(where: { $0 > 44 } )
// should return 4

aColl.indices
// should return CountableRange(0..<12)

aColl.isEmpty
// should return false

aColl.map( { $0 * 2 } )
// should return [22, 44, 66, 88, 110, 132, 154, 176, 198, 220, 242, 264]

aColl.prefix(2)
// should return [11, 22]

aColl.prefix(through: 4)
// should return [11, 22, 33, 44, 55]

aColl.prefix(upTo: 4)
// should return [11, 22, 44]

aColl.removeFirst()
// returns 22, leaves aColl set to [22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132]

aColl.removeFirst(2)
// leaves aColl set to [44, 55, 66, 77, 88, 99, 110, 121, 132]

aColl.removeLast()
// returns 132, leave aColl set to [44, 55, 66, 77, 88, 99, 110, 121]

aColl.removeLast(2)
// leave aColl set to [44, 55, 66, 77, 88, 99]

aColl.split(separator: 66)
// returns array of sequences [[44, 55], [77, 88, 99]]

aColl.suffix(2)
// returns [88, 99]

aColl.suffix(from: 2)
// returns [66, 77, 88, 99]











