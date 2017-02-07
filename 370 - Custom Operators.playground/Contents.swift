// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Custom Operators
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// ------------------------------------------
// Custom Operators
// ------------------------------------------

import Darwin

prefix operator √

prefix func √ (operand: Double) -> Double
{
    return sqrt(operand)
}

print (√25)
// outputs 5.0





// ------------------------------------------
// Custom Infix Operators
// ------------------------------------------

struct Rect
{
    var x = 0.0, y = 0.0, width = 0.0, height = 0.0
    
    func area() -> Double
    {
        return (width * height)
    }
    
    static func < (left: Rect, right: Rect) -> Bool
    {
        return left.area() < right.area()
    }
    
    static func + (left: Rect, right: Rect) -> Rect
    {
        return Rect (
            x: min(left.x, right.x),
            y: min(left.y, right.y),
            width: max(left.width, right.width),
            height: max(left.height, right.height)
        )
    }
    
}


var a = Rect (x:5, y:5, width:5, height:5)
var b = Rect (x:6, y:6, width:10, height:10)
var c = a + b
dump (c)
// c is now a Rect where
// (x=5.0, y=5.0, width=10.0, height=10.0)


var e = Rect(x:0, y:0, width:4, height:5)
var f = Rect(x:5, y:5, width:5, height:5)
e<f
// returns true


    

// ------------------------------------------
// Custom Unary Operators
// ------------------------------------------

postfix func ++ ( r: inout Int) -> Int
{
    let temp = r;
    r += 1
    return temp
}
var ii = 1
ii++


postfix func ++ ( r: inout Rect) -> Rect
{
    let temp = r;
    r.x += 1.0
    r.y += 1.0
    return temp
}


var d1 = Rect(x:5, y:5, width:5, height:5)
var d2 = d1++
// returns a Rect where
// (x=5.0, y=5.0, width=5.0, height=5.0)
dump(d2)
dump(d1)
// but d1 is a Rect where
// (x=6.0, y=6.0, width=5.0, height=5.0)




// ------------------------------------------
// Precedence Groups
// ------------------------------------------

class C {
    var p = 0
}

precedencegroup ourOwnAssignment {
    assignment: true
}

infix operator >< : ourOwnAssignment

func >< (left: inout Int, right: Int)
{
    left = right
}

var a1 = 4
print (a1)
a1 >< 45
print (a1)

var v: C? = C()
print ("v.p is ", v!.p)

// without the "assignment" attribute on the precedence group,
// this next assignment will fail
v?.p >< 4
print ("v.p is ", v!.p)


