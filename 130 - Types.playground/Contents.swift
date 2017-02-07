// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Types
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif


// ------------------------------------------
// Specific Integer Types
// ------------------------------------------

Int8.min
Int8.max

UInt8.min
UInt8.max


Int16.min
Int16.max

UInt16.min
UInt16.max


Int32.min
Int32.max

UInt32.min
UInt32.max


Int64.min
Int64.max

UInt64.min
UInt64.max



// ------------------------------------------
// Numeric Literals
// ------------------------------------------

17
1024
2.767
2.5e2
0b10001011
0o213
0x8D
0x4.8p2
1_000_000
1_00_00_00
1000000



// ------------------------------------------
// Character and String Literals
// ------------------------------------------

"A"
"B"
"!"

"Hello, World"

let someChar: Character = "C"
// "C" is treated as a character literal

var c: Character
c = "A"
// "A" is treated as a character literal



// ------------------------------------------
// Type Aliases
// ------------------------------------------

typealias Byte = UInt8
var acc: Byte = 64

// create an alias for a function type that takes a
// double, and returns a double
typealias DoubleInDoubleOut = (Double) -> Double

// create a function based on this type
var f: DoubleInDoubleOut = {
    return $0 * $0
}

// call it
f(12.0)
// returns 144.0



// ------------------------------------------
// Nested Types
// ------------------------------------------

class A
{
    class B
    {
        var i = 0
    }
    var j = B()
    var k = 0
}

var a = A()
var b = A.B()
a.j.i = 2
b.i = 5


class C
{
    enum TravelClass
    {
        case first, business, economy
    }
    
    // remainder of class definition
}

var t = C.TravelClass.first



// ------------------------------------------
// Determining Types
// ------------------------------------------

type(of: 4<5)
// returns Bool.Type 

print (type(of: "Hello"))
// outputs String.Type


