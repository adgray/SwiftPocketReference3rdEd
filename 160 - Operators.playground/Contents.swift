// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Operators
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif


// ------------------------------------------
// No implicit Type Conversion
// ------------------------------------------

let i = 2
let f = 45.0
//let errResult = (f / i)  // error
let result = (f / Double(i))



// ------------------------------------------
// Atithmetic Operators
// ------------------------------------------

4 + 5
"A" + "B"

var a: UInt8 = UInt8.min
//a = a - 1  // arithmetic underflow runtime error



// ------------------------------------------
// Bitwise Operators
// ------------------------------------------

let boA: UInt8 = 0
let boB: UInt8

~boA
0x80 & 0xFF
0x80 | 0xC0
0xF0 ^ 0x80
0x01 << 2
0x80 >> 1



// ------------------------------------------
// Compound Assignment Operators
// ------------------------------------------

var v: Int = 0
v += 32
v -= 16
v *= 2
v /= 4
v %= 7
v <<= 4
v >>= 1
v &= 0x0f
v |= 0x07
v ^= 0xff



// ------------------------------------------
// Comparison Operators
// ------------------------------------------

true == false
true != false
5 < 10
5 <= 5
5 > 10
5 >= 10

class DemoClass { }
let m = DemoClass()
let n = DemoClass()
let o = m

m === n
m === o
m !== n
m !== o



// ------------------------------------------
// Logical Operators
// ------------------------------------------

!true

true && true
true && false
false && false

true || true
true || false
false || false



// ------------------------------------------
// Overflow Operators
// ------------------------------------------

UInt8(200) &+ UInt8(100)
UInt8(50) &- UInt8(100)
UInt8(16) &* UInt8(16)

let (overflowResult, overflow) = UInt8.addWithOverflow(200, 100)
overflowResult
overflow


// ------------------------------------------
// Type Casting Operators
// ------------------------------------------

// (see samples in 310 - Checking and Casting Types)



// ------------------------------------------
// Range Operators
// ------------------------------------------
print ("\n-range operators")

for i in 1..<5 {
    print (i, " ", terminator: "")
}
print()

for i in 1...5 {
    print (i, " ", terminator: "")
}
print()




// ------------------------------------------
// Ternary Conditional Operator
// ------------------------------------------
//
let leapYear = true
let februaryDays = leapYear ? 29 : 28




// ------------------------------------------
// Nil-Coalescing Operator
// ------------------------------------------
print ("\n-nil-coalescing operator")

var optionalString: String? = "OptionalString"
optionalString = nil // comment out to test
let otherwiseValue = "Default value"
let finalString = optionalString ?? otherwiseValue
print (finalString)


