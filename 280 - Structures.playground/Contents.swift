// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Structures
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// ------------------------------------------
// Methods in Structures
// ------------------------------------------

struct Rect1
{
    var x = 0.0, y = 0.0, width = 0.0, height = 0.0
    
    func area() -> Double
    {
        return (width * height)
    }
}



// ------------------------------------------
// Mutating Methods
// ------------------------------------------

struct Rect2
{
    var x = 0.0, y = 0.0, width = 0.0, height = 0.0
    
    mutating func enlarge(by size: Double)
    {
        width += size
        height += size
    }
}



// ------------------------------------------
// Initializers in Structures
// ------------------------------------------

struct Rect3
{
    var x=0.0, y=0.0, width=0.0, height=0.0
}

var r3a = Rect3()
var r3b = Rect3(x:2.0, y:2.0, width:2.0, height:5.0)


struct Rect4
{
    var x=0.0, y=0.0, width=0.0, height=0.0
    
    init (x: Double, y: Double, side: Double)
    {
        self.x = x
        self.y = y
        self.width = side
        self.height = side
    }
}

var r4a = Rect4(x: 2.0, y: 2.0, side: 5.0)
r4a.width
r4a.height



// ------------------------------------------
// Initializer delegation in structures
// ------------------------------------------

struct Color
{
    var r, g, b: Double
    
    init(r: Double, g: Double, b: Double)
    {
        self.r = r
        self.g = g
        self.b = b
    }
    
    init()
    {
        self.init(r: 0.0, g: 0.0, b: 0.0) // default black
    }
    
}

let c1 = Color(r: 0.0, g: 1.0, b: 0.5)
let c2 = Color()






