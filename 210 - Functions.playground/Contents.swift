// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Functions
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------



#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// ------------------------------------------
// Parameter Names
// ------------------------------------------

func addString (_ a: String, _ b: String) -> String
{
    return b + a
}
let s1 = addString("apple", "toffee")




// ------------------------------------------
// Argument Names
// ------------------------------------------

func append (_ a: String, to b: String) -> String
{
    return b + a
}
let s2 = append("apple", to: "pine")




// ------------------------------------------
// inout Parameters
// ------------------------------------------

func square (_ a: inout Double)
{
    a = a * a
}

var x = 11.0
square(&x)




// ------------------------------------------
// Returning Optional Values
// ------------------------------------------

print ("\n-optionals")
func divide(_ dividend: Double, by divisor: Double) -> Double?
{
    if (divisor == 0) { return nil }
    return dividend / divisor
}


let d = divide (9.0, by: 3.0)
if d != nil {
    // value is valid
    print (d!)
} else {
    // value is invalid
}

// let binding
if let d2 = divide(9.0, by: 3.0) {
    print (d2)
}



// ------------------------------------------
// Returning Multiple Values by using Tuples
// ------------------------------------------

func range() -> (lower: Int, upper: Int)
{
    return (4, 9)
}


print ("\n-tuple returns")
let limits = range()
for i in limits.lower...limits.upper {
    print (i)
}



// ------------------------------------------
// Default Parameter Values
// ------------------------------------------

func addSuffix (_ a: String, to b: String = "pine") -> String
{
    return b + a
}
let snack = addSuffix("apple", to: "toffee-")
let seed = addSuffix("cone")



// ------------------------------------------
// Variadic Parameters
// ------------------------------------------

func sumOfInts(_ numbers: Int...) -> Int
{
    var tot = 0
    for i in numbers { tot += i }
    return tot
}

sumOfInts(2, 3)
sumOfInts(5, 9, 11, 13, 22)



// ------------------------------------------
// Function Types
// ------------------------------------------

var generalFunc: (Int) -> Int

func addOne (_ i: Int) -> Int { return i+1 }
func addTwo (_ i: Int) -> Int { return i+2 }
func times8 (_ i: Int) -> Int { return i*8 }
generalFunc = addOne

addOne(4)      // returns 5
generalFunc(5) // returns 6
generalFunc = addTwo
generalFunc(5) // returns 7
generalFunc = times8
generalFunc(3)


func operation(_ p: Int, _ f: (Int)->Int) -> Int
{
    return f(p)
}

operation(4, addOne)  // returns 5
operation(5, times8)  // returns 40






