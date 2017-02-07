// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Extensions
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// ------------------------------------------
// Computed Property Extensions
// ------------------------------------------

extension Int
{
    var asHex: String {
        var temp = self
        var result = ""
        let digits = Array("0123456789abcdef".characters)
        while temp > 0 {
            result = String(digits[Int(temp & 0x0f)]) + result
            temp >>= 4
        }
        return result
    }
}

45.asHex
// returns "2d"
var s = 100.asHex
// stores "64" in a new String variable s




// ------------------------------------------
// Method Extensions
// ------------------------------------------

extension Int
{
    func paddedRight(width: Int) -> String
    {
        var s = "\(self)"
        while s.characters.count <= width {
            s = " " + s
        }
        return s
    }
}

let x = -45
x.paddedRight(width: 5)
// returns "  -45"



extension Double
{
    mutating func trunc()
    {
        self = Double(Int(self))
    }
}

var d = 45.5
d.trunc()
// d is now 45.0




// ------------------------------------------
// Subscript Extensions
// ------------------------------------------

extension String
{
    subscript (i: Int) -> Character {
        return Array(self.characters)[i]
    }
}

"Hello"[4]
// returns "o"
var a = "Alphabetical"
a[0]
// returns "A"



extension UInt8
{
    subscript(whichBit: UInt8) -> UInt8 {
        get { return (self >> whichBit) & 1 }
        set {
            let mask = 0xFF ^ (1 << whichBit)
            let bit = (newValue & 1) << whichBit
            self = self & mask | bit
        }
    }
}

var b: UInt8 = 0
b[0] = 1
b[7] = 1
b
// returns 129



