// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Program Flow - Loops
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// ------------------------------------------
// for-condition-increment loops
// ------------------------------------------

print ("\nfor-in loop with range")
for i in 3...8
{
    print (i)
}


print ("\nfor-in loop with array")
let microprocessors = ["Z80", "6502", "i386"]
for i in microprocessors
{
    print (i, terminator:", ")
}
// prints:
// Z80, 6502, i386,


print ("\nfor-in loop with dictionary")
let vehicles = ["bike":2, "trike":3, "car":4, "lorry":18]
for (vehicle, wheels) in vehicles
{
    print (vehicle, terminator: ", ")
}
// prints:
// car, bike, trike, lorry,


print ("\nfor-in loop with where clause")
var out = ""
for i in 0...15 where (i % 3) != 0
{
    if (out != "") { out += ", " }
    out += String(i)
}
print (out)
// prints "1, 2, 4, 5, 7, 8, 10, 11, 13, 14"


print ("\nfor-in loop with case clause")
let processors: [(name: String, buswidth: Int)] = [
    ("Z80", 8),
    ("16032", 16),
    ("80286", 16),
    ("6502", 8)
]
for case let (name, 8) in processors {
    print ("the", name, "has a bus width of 8 bits")
}


print ("\nfor-in loop with enum")
enum NetworkAddress {
    case mac(String)
    case ipv4(UInt8, UInt8, UInt8, UInt8)
}
let addresses = [
    NetworkAddress.ipv4(192, 168, 0, 1),
    NetworkAddress.ipv4(8, 8, 8, 8),
    NetworkAddress.mac("00:DE:AD:BE:EF:00")
]
for case let .ipv4(a, b, c, d) in addresses {
    print (a, b, c, d, separator:".")
}


// ------------------------------------------
// while loops
// ------------------------------------------
print ("\nwhile loop")
var count = 0
while count < 10
{
    print (count)
    count += 1
}


print ("\nrepeat-while loop")
var t = 0
repeat
{
    print (t)
    t += 1
} while t < 10



// ------------------------------------------
// early termination of loops
// ------------------------------------------
print ("\nearly termination of loops")
for i in 0...15
{
    if (i % 3) == 0 { continue }
    if i == 11 { break }
    print (i)
}

