// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Global Functions
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// set up some things we'll use later
class AClass
{
}

class BClass: AClass
{
}

class CClass
{
}

class DClass
{
}


// ---------------------------------------------------------------
// Global Functions
// ---------------------------------------------------------------


// abs(x)
let absVar1 = abs(-34)   // returns Int of 34
let absVar2 = abs(12)    // returns Int of 12
let absVar3 = abs(-76.5) // returns Double as 76.5



// assert(condition: Bool [, message: String])
let assertVal = false
assert(assertVal == false, "Argh! Booleans are broken")



// assertionFailure([message: String])
// will abort playground execution if uncommented
// assertionFailure("Should not have run this")



// debugPrint(items... [, separator: String] [, terminator: String] [, to: &target])
var debugStr = "We're "
debugPrint(debugStr, "using debugPrint")
debugPrint("Line 1", "Line 2", separator:"\n", terminator:"\n*****")
debugPrint("sending our love down the well", to: &debugStr)
debugStr



// dump(instance)
let dump1 = ["Hello", "Lemon", "Bill", "Ben"]
dump(dump1)



// fatalError([message: String])
// will abort playground execution if uncommented
// fatalError("Should not have run this")



// getVAList(args: CVarArgType)



// isKnownUniquelyReferenced(inout x)
var inst1 = DClass()
var inst2 = DClass()
var inst3 = inst2
isKnownUniquelyReferenced(&inst1) // should be true (only one reference)
isKnownUniquelyReferenced(&inst2) // should be false (two references)



// max(list)
let maxVar = max(11, 100, 92, 67) // assigns 100



// min(list)
let minVar = min(11, 100, 92, 67) // assigns 11



// numericCast(x)
func f1 (x: Int) { }
let i8: UInt8 = 4
//f1(x: i8) // will fail since i8 is not an Int
f1(x: numericCast(i8)) // works - i8 gets cast to correct Int type automatically



// precondition(condition: Bool[, message: String])
precondition(assertVal == false, "Argh! Booleans are broken")



// preconditionFailure([message: String])
// will abort playground execution if 
// preconditionFailure("Should not have run this")



// print(items... [, separator: String] [, terminator: String] [, to: &target])
print ("Hi")
print ("Hi", "there")
print ("Hi ", terminator: "")
print ("there again")
print (192, 168, 0, 1, separator: ".")
var receiver: String = ""
print ("This is being sent to a string", to: &receiver)
receiver



// readLine([stripNewLine: Bool])
// works in a swift script, but not in a playground
// let someInput = readLine()



// repeatElement(T, count: Int)
let zeroes = repeatElement(0, count: 25)
dump(zeroes)


// stride through:
print ("\nstride through: test")
for x in stride(from:2.1, through:2.7, by:0.3) {
    print (x, terminator:", ")
}


// stride to:
print ("\nstride to: test")
for x in stride(from:2, to:8, by:2) {
    print (x, terminator:", ")
}
print()


// swap(&x, &y)
var swapA = 56
var swapB = 72
swap (&swapA, &swapB)
swapA
swapB



// transcode(input: Input, from: InputEncoding.Type, to: outputEncoding.Type, stoppingOnError: Bool, into: Output)



// unsafeBitCast(x, to: t)
let int1: Int8 = -10
let int2: UInt8 = unsafeBitCast(int1, to: UInt8.self)



// unsafeDowncast(x, to: Type)
var safeInstA = AClass()
var safeInstB = BClass()
var safeInstC = CClass()
var unsafeRef1 = unsafeDowncast(safeInstB, to: AClass.self)
// unsafeRef1 is of type AClass
// var unsafeRef2 = unsafeDowncast(safeInstC, to: AClass.self)  // will crash
// since safeInstC is not an AClass, or a class derived from it



// withExtendedLifetime(x, f)




// withUnsafeMutablePointer()
var someInt = 16
print ("Before:", someInt)
withUnsafeMutablePointer(to: &someInt) { p in
    p.pointee = 32
}
print ("After:", someInt)



// withUnsafePointer()
withUnsafePointer(to: &someInt) { p in
    print (p.pointee)
}



// withVaList(args: [CVarArgType], f)



// zip(SequenceType1, SequenceType2)
let zipSeq1 = ["alpha", "beta", "gamma"]
let zipSeq2 = [65, 66, 67]
let zipResult = zip(zipSeq1, zipSeq2)
let zippedArray = Array(zipResult)
dump(zippedArray)




