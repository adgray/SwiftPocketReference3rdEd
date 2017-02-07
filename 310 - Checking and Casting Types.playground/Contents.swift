// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Checking and Casting Types
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// ------------------------------------------
// Any and AnyObject
// ------------------------------------------

var v = [Any]()
v.append(2)
v.append(3.4)
v.append("crunch")




// ------------------------------------------
// Checking Types
// ------------------------------------------

class A { }
class B: A { }
class C { }

var a = A()
var b = B()
var c = C()


func isInstanceOfA(_ t: Any) -> Bool
{
    return t is A
}

isInstanceOfA(a) // true
isInstanceOfA(b) // true
isInstanceOfA(c) // false


typealias DoubleInDoubleOut = (Double) -> Double
var myFuncType: DoubleInDoubleOut = {
    return $0 * $0
}
var funcs = [Any]()
funcs.append(myFuncType)



// ------------------------------------------
// Downcasting Types
// ------------------------------------------

class Shape { }
class Square: Shape
{
    func describe()
    {
        print("I am a square")
    }
}
class Circle: Shape
{
    func identify()
    {
        print("I am a circle")
    }
}


var shapes = [Shape]()

let sq = Square()
let ci = Circle()

shapes.append(sq)
shapes.append(ci)


for s in shapes
{
    if let c = s as? Circle {
        // c is now a reference to an array entry downcast
        // as a circle instead of as a generic shape
    } else {
        // downcast failed
    }
}


for s in shapes
{
    switch s {
    case let cc as Circle:
        cc.identify()
    case let ss as Square:
        ss.describe()
    default:
        break;
    }
}


for s in shapes
{
    (s as? Circle)?.identify()
    (s as? Square)?.describe()
}


for s in shapes {
    if s is Circle {
        let c = s as! Circle
        c.identify()
    }
}




// ------------------------------------------
// The Any Types
// ------------------------------------------

var vAny = [Any]()
vAny.append(2)
vAny.append(3.4)
vAny.append("crunch")
vAny



