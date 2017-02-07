// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Strings and Characters
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



var astring = "Hello"
var achar: Character = "A"
let dogface: Character = "\u{1f436}"

let newString = "Hello" + " Bill"

var welcome = "Hello"
welcome += " there"



// ------------------------------------------
// Strings Properties
// ------------------------------------------

astring.characters
astring.characters.count

astring.isEmpty

astring.utf8
astring.utf16
astring.unicodeScalars



// ------------------------------------------
// Comparing Strings
// ------------------------------------------

let name = "Fred"
astring == name
astring != name
astring < name
astring <= name
astring > name
astring >= name

astring.hasPrefix("He")
astring.hasSuffix("lo")

// string comparison via sorting
var strArr = ["zebra", "Billy", "albert", "bob", "äric", "aaron", "able", "Zero"]
strArr.sort()



// ------------------------------------------
// Escaped Characters in Strings
// ------------------------------------------

let escaped = "This is an\ninteresting \"string\" to show off \'escaping\'"
print (escaped)



// ------------------------------------------
// String Interpolation
// ------------------------------------------

let costOfMeal = 56.80
let advice = "Consider tipping around \(costOfMeal * 0.20)"

let a = "Hi"
let b = "there"
let c = "\(a) \(b)"

let valueAsString = String(52.56)



// ------------------------------------------
// Conversion of Strings to Numeric Types
// ------------------------------------------

let intFromStr = Int("45")
let doubleFromStr = Double("23.2")
let intFromHexStr = Int("2d", radix:16)



// ------------------------------------------
// Conversion of other types to Strings
// ------------------------------------------

let strFromInt = String(45)
let strFromDouble = String(23.2)
let strFromBool = String(true)

let hexStrFromInt = String(45, radix: 16, uppercase: true)

let strFromTuple = String(describing: (1, 2, 3))
let strFromArray = String(describing: [1, 6, 91])




// ------------------------------------------
// Character-level Acccess in Strings
// ------------------------------------------

let aWithUmlaut: Character = "a\u{308}"
var uString = "a\u{308}"

uString.characters.count
uString.utf8.count
uString.utf16.count
uString.unicodeScalars.count


let str = "Swift"


print ("\n-character-level access in strings")
for i in str.characters {
    print (i, terminator: ", ")
}


print ("\n\n-accessing characters in utf8 view by indices")
for i in str.utf8.indices {
    print (str.utf8[i], terminator: ", ")
}


print ("\n\n-accessing characters in utf8 view by index")
var i = str.utf8.startIndex
while (i != str.utf8.endIndex) {
    print (str.utf8[i], terminator: ", ")
    i = str.utf8.index(after: i)
}




// ------------------------------------------
// Inherited Behaviour
// ------------------------------------------
//
print ("\n\n-inherited behaviour")
astring.append(achar)
astring.append(dogface)
astring.append(astring)
astring.append(contentsOf: astring.characters)
astring.hashValue
astring.lowercased()
astring.removeAll(keepingCapacity: true)

astring = "HelloA🐶"
if let foundAt = astring.characters.index(of: "o") {
    print ("removing an 'o'")
    astring.remove(at: foundAt)
}
astring

if let foundAt = astring.characters.index(of: "l") {
    print ("removing from 'l' to end of string")
    astring.removeSubrange(foundAt..<astring.endIndex)
}
astring

astring.replaceSubrange(astring.startIndex..<astring.endIndex, with: "Hiya🐱")
astring.reserveCapacity(100)
astring.uppercased()

var bstring: String = "\nStream output to a string\nAppending:"
astring.write(to: &bstring)
print (bstring)


import Foundation
let msg = "Hi there %name%, welcome to the party!"
let tag = "%name%"
let guest = "Lisa"
let greet = msg.replacingOccurrences(of: tag, with: guest)




