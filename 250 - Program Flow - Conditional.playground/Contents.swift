// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Program Flow - Conditional
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif


let stringArray = ["45", "27", "Apple", "3"]




// ------------------------------------------
// if-else
// ------------------------------------------

print ("if-else examples")

var b1: Bool
var b2: Bool
b1 = false
b2 = false

if b1 {
    print ("condition met")
} else {
    print ("condition not met")
}



if b1 {
    print ("first condition met")
} else if b2 {
    print ("first condition not met\n",
        "second condition met")
} else {
    print ("no conditions met")
}



// ------------------------------------------
// if optional binding
// ------------------------------------------

for str in stringArray {
    if let ageAsInt = Int(str),
        ageAsInt >= 18
    {
        print (ageAsInt, "is old enough to vote")
    }
}



// ------------------------------------------
// if-case
// ------------------------------------------

var age = 23
if case 16...35 = age {
    print ("You're our target demographic!")
}



// ------------------------------------------
// guard-else
// ------------------------------------------

print ("\nguard-else examples")
func someAction()
{
    guard b1 == true else
    {
        return // exit scope
    }
    // continue execution
    // ...
}



for str in stringArray {
    guard let ageAsInt = Int(str) else
    {
        // not an int literal, so ignore
        continue
    }
    print ("age:", ageAsInt)
}


for str in stringArray {
    guard let ageAsInt = Int(str), ageAsInt >= 18 else
    {
        // not an int literal, so ignore
        continue
    }
    print ("adult age:", ageAsInt)
}



// -----------------------------------------------
// Conditional execution based on API availability
// -----------------------------------------------

if #available(macOS 10.10, *) {
    // macos 10.10 feature available
    print ("macOS 10.10 features are available here")
} else {
    // use earlier macOS feature
    print ("macOS 10.10 features are not available - use default features")
}


@available(macOS 10.10, *)
func macOS10_10func() {
    print ("macos 10.10 function called")
}
func defaultFunc() {
    print ("non-macos 10.10 function called")
}

if #available(macOS 10.10, *) {
    macOS10_10func()
} else {
    defaultFunc()
}



// ------------------------------------------
// switch
// ------------------------------------------

print ("\nswitch examples")
var n = 3
switch n {
case 0:
    print ("none")
case 1:
    print ("unit")
case 2:
    print ("pair")
case 3:
    print ("trio")
default:
    print ("lots")
}


var letter = "c"
switch letter {
case "a", "e", "i", "o", "u":
    print ("the letter \(letter) is a vowel")
case "b", "d", "g", "k", "p", "t":
    print ("the letter \(letter) may be a plosive sound in English")
    fallthrough
case "c", "f", "h", "j", "l", "m", "n", "q", "r", "s",
"v", "w", "x", "y", "z":
    print ("the letter \(letter) is a consonant")
default:
    print ("the letter\(letter) doesn't interest me")
}



// ------------------------------------------
// Matching ranges in a case clause
// ------------------------------------------

print ("\nmatching a range in a case claise")

var marbles = 600
switch marbles {
case 0:
    print("You've lost your marbles!")
case 1:
    print("I see you have a marble")
case 2...5:
    print("I see you have some marbles")
case 6...10:
    print("That's quite a handful of marbles!")
case 10...99:
    print("That's lots and lots of marbles")
default:
    print("Were marbles on sale?")
}




// ------------------------------------------
// Using tuples in a case clause
// ------------------------------------------

print ("\nusing tuples in a case clause")

var year = 9             // 7-10
var house = "Columbus"   // "Columbus", or "Cook"
var weekday = "Fri"      // "Mon" through "Fri"

var record = (house, year, weekday)

switch record {
case ("Columbus", 7...8, "Mon"):
    print ("Sports: Cricket")
case ("Cook", 7...8, "Mon"):
    print ("Sports: Netball")
case ("Columbus", 9...10, "Tue"):
    print ("Sports: Football")
case ("Cook", 9...10, "Tue"):
    print ("Sports: Tennis")
case (_, 7...8, "Wed"):
    print ("Music")
case (_, 9...10, "Wed"):
    print ("Theater")
case (_, 7...10, "Thu"):
    print ("Sciences")
case (_, 7...10, "Fri"):
    print ("Humanities")
default:
    print("nothing scheduled or invalid input")
}
// outputs "Humanities"


// ------------------------------------------
// Value binding with tuples and ranges
// ------------------------------------------

print ("\nvalue binding in a case clause")

weekday = "Thu"
record = (house, year, weekday)

switch record {
case ("Columbus", 7...8, "Mon"):
    print ("Sports: Cricket")
case ("Cook", 7...8, "Mon"):
    print ("Sports: Netball")
case ("Columbus", 9...10, "Tue"):
    print ("Sports: Football")
case ("Cook", 9...10, "Tue"):
    print ("Sports: Softball")
case (_, 7...8, "Wed"):
    print ("Music")
case (_, 9...10, "Wed"):
    print ("Theater")
case (_, let year, "Thu"):
    print ("Year \(year) Science")
case (_, 7...10, "Fri"):
    print ("Humanities")
default:
    print("nothing scheduled or invalid input")
}



// ------------------------------------------
// The where qualifier
// ------------------------------------------

print ("\nthe where qualifier in a case clause")

year = 7
record = (house, year, weekday)

switch record {
case ("Columbus", 7...8, "Mon"):
    print ("Sports: Cricket")
case ("Cook", 7...8, "Mon"):
    print ("Sports: Netball")
case ("Columbus", 9...10, "Tue"):
    print ("Sports: Football")
case ("Cook", 9...10, "Tue"):
    print ("Sports: Softball")
case (_, 7...8, "Wed"):
    print ("Music")
case (_, 9...10, "Wed"):
    print ("Theater")
case (_, 7, let day) where day.hasPrefix("T"):
    print ("Home Economics")
case (_, 7...10, "Fri"):
    print ("Humanities")
default:
    print("nothing scheduled or invalid input")
}




// ------------------------------------------
// Using switch with enumerations
// ------------------------------------------

print ("\nusing switch with enumerations")

enum TravelClass {
    case first, business, economy
}

var thisTicket = TravelClass.first

switch thisTicket {
case .first:
    print ("Cost is $800")
case .business:
    print ("Cost is $550")
case .economy:
    print ("Cost is $200")
}
// outputs "Cost is $800"




// ------------------------------------------
// Statement labels
// ------------------------------------------

print ("\nstatement labels")

outerloop: for i in 1..<10 {
    for j in 1..<10 {
        if ((i == 6) && ((i * j) >= 30))
        { continue outerloop }
        print (i * j)
    }
    print ("-")
}




// ------------------------------------------
// do scopes
// ------------------------------------------

do {
    print ("hi")
    var aa = 45
    print (aa)
}

//print (aa)  // aa is underfined





// ------------------------------------------
// deferred execution
// ------------------------------------------

print ("\ndeferred execution examples")
do {
    defer {
        print ("Goodbye")
    }
    print ("Hello")
}


for i in 0...4
{
    defer { print ("+++") }
    
    print (i)
}


