// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Protocols
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



import Foundation



// ------------------------------------------
// Required Properties
// ------------------------------------------

protocol SomeProtocol
{
    var aWritableProperty: Double { get set }
    var aReadOnlyProperty: Int { get }
    static var aTypeProperty: String { get set }
}




// ------------------------------------------
// Required Methods
// ------------------------------------------

protocol Printable
{
    func asText() -> String
}




// ------------------------------------------
// Optional Methods and Properties
// ------------------------------------------

@objc protocol Optionals
{
    @objc optional var optProperty: String { get }
    @objc optional func optMethod(_ i: Int) -> String
}


class ImplementsProperty: Optionals
{
    @objc let optProperty = "I'm a property!"
}

class ImplementsMethod: Optionals
{
    @objc func optMethod(_ i: Int) -> String
    {
        return "I'm a method and was passed \(i)"
    }
}


let optA: Optionals = ImplementsProperty()
let optB: Optionals = ImplementsMethod()

type(of: optA.optProperty)
optA.optProperty
optB.optProperty

// optA.optMethod(45) // compile-time error
optA.optMethod?(45)
// returns nil

optB.optMethod?(1)
// returns an optional String? "I am a method and was passed 1"

optB.optProperty
// returns nil




// ------------------------------------------
// Adopting Protocols with Extensions
// ------------------------------------------

extension Bool: Printable
{
    func asText() -> String
    {
        return self ? "YES":"NO"
    }
}

let a = false
a.asText()
// returns "NO"




// ------------------------------------------
// Inheritance and Protocols
// ------------------------------------------

protocol Hexable : Printable
{
    func asHex() -> String
}


extension Bool: Hexable
{
    func asHex() -> String
    {
        return self ? "1":"0"
    }

    // in this playground, we can't define printable here, because it's
    // already defined earlier in this file as part of a separate example
//    func printable() -> String
//    {
//        return self ? "YES":"NO"
//    }
    
}


let b = true
b.asHex()
b.asText()




// ------------------------------------------
// Using a Protocol as a Type
// ------------------------------------------

extension Int: Hexable
{
    func asHex() -> String
    {
        var temp = self
        var result = ""
        let digits = Array("0123456789abcdef".characters)
        while (temp > 0) {
            result = String(digits[Int(temp & 0x0f)]) + result
            temp >>= 4
        }
        return result
    }
    
    func asText() -> String
    {
        return "\(self)"
    }
    
}


var c: Hexable = true
c.asText()      // returns "YES"
c.asHex()       // returns "1"
c = 45
c.asText()      // returns "45"
c.asHex()       // returns "2d"


var ar = [Hexable]()
ar.append(true)
ar.append(45)
ar[0].asHex()   // returns "1"
ar[1].asHex()   // returns "2d"




// ------------------------------------------
// Checking Protocol Conformance
// ------------------------------------------

@objc protocol DemoProto
{
}

class ProtoClass: DemoProto
{
}

class NonProtoClass
{
}

func protoCheck(_ t: AnyObject) -> Bool
{
    return t is DemoProto
}


let s = ProtoClass()
let t = NonProtoClass()
protoCheck(s)  // returns true
protoCheck(t)  // returns false




// ------------------------------------------
// Protocol Extensions
// ------------------------------------------

extension UnsignedInteger
{
    var asHex: String {
        var temp: UInt = numericCast(self)
        var result = ""
        let digits = Array("0123456789abcdef".characters)
        for _ in 0..<MemoryLayout<Self>.size * 2 {
            result = String(digits[Int(temp & 0x0f)]) + result
            temp >>= 4
        }
        return result
    }
}

let u1: UInt8 = 16
let u2: UInt16 = 38
let u3: UInt32 = 32767
u1.asHex
u2.asHex
u3.asHex


