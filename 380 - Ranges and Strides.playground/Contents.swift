// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Ranges and Strides
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// ------------------------------------------
// CountableRange
// ------------------------------------------

print ("\nCountableRange tests")

var r1 = 1..<6
r1
// returns CountableRange(1..<6)
r1.lowerBound
// returns 1
r1.upperBound
// returns 6

for x in r1 {
    print (x, terminator: ", ")
}
// prints:
// 1, 2, 3, 4, 5,




// ------------------------------------------
// ClosedCountableRange
// ------------------------------------------

print ("\nClosedCountableRange tests")

var r2 = 1...6
r2
// returns CountableClosedRange(1...6)
r2.lowerBound
// returns 1
r2.upperBound
// returns 6

for x in r2 {
    print (x, terminator: ", ")
}
// prints:
// 1, 2, 3, 4, 5, 6




// ------------------------------------------
// Range and ClosedRange
// ------------------------------------------

var i = 1.0...2.0

i.lowerBound    // returns 1.0
i.upperBound    // returns 2.0
i.isEmpty       // returns false


// equality
i == 1.0...2.0
i == 1.0...3.6


// containment
i.contains(3.4) // returns false
i.contains(1.6) // returns true
i ~= 3.4
i ~= 1.6



//// clamping
let c = i.clamped(to: 1.5...2.5) // 1.5...2.0
let d = i.clamped(to: 0.1...0.2) // 1.0...1.0
let e = i.clamped(to: 3.0...4.0) // 2.0...2.0


//// overlaps
i.overlaps(1.2...1.4) // true
i.overlaps(2.0...3.0) // true
i.overlaps(4.0...5.0) // false


// force-create integer Range/ClosedRange 
// (as opposed to CountableRange/CountableClosedRange)
let jc = 2..<3
let jr = Range(2..<3)
let k: ClosedRange = 4...14




// ------------------------------------------
// strides
// ------------------------------------------


print ("\nexclusive stride test")
var se = stride(from:2, to:8, by:2)

for x in se {
    print (x, terminator:", ")
}
// outputs
// 2, 4, 6,


print ("\ninclusive stride output test")
for x in stride(from:2.1, through:2.7, by:0.3) {
    print (x, terminator:", ")
}
// outputs
// 2.1, 2.4, 2.7,



