// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Tuples
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif


(4, 5)
(2.0, 4)
("Hello", 2, 1)

var l = (4, 5)
var m = (2.0, 4)
var n = ("Hello", 2, 1)



// ------------------------------------------
// Tuple Variables and Constants
// ------------------------------------------

var loco = ("Flying Scotsman", 4472, "4-6-2")

var a: (String, Float) = ("Rate", 6.5)
let fullName: (String, String) = ("Bill", "Jackson")



// ------------------------------------------
// Extracting tuple components
// ------------------------------------------

let name = loco.0         // assigns "Flying Scotsman"
let number = loco.1       // assigns 4472



// ------------------------------------------
// Naming tuple components
// ------------------------------------------

let person = (name: "Fred", age: 21)
let c = person.age

let result = (errCode: 56, errMessage: "file not found")
let s = result.errMessage
// s is now the string "file not found"



// ------------------------------------------
// Using Type Aliases with Tuples
// ------------------------------------------

typealias locoDetail =
    (name: String, number: Int, configuration: String)
var thomas: locoDetail = ("Thomas", 1, "0-6-0")

func nextLoco() -> locoDetail
{
    // do something then return a value of type locoDetail
    return ("Flying Scotsman", 4472, "4-6-2")
}

var anEngine = nextLoco()



// ------------------------------------------
// Tuples as Return Types
// ------------------------------------------

func readLine() -> (Bool, String)
{
    // read a line from the file, and set EOF accordingly
    let line = "pretend input"
    let EOF = false
    return (EOF, line)
}

func anotherReadLine() -> (eof: Bool, readLine: String)
{
    // read a line from the file, and set EOF accordingly
    let line = "pretend input"
    let EOF = false
    return (EOF, line)
}



// ------------------------------------------
// Comparing Tuples (SE-0015)
// ------------------------------------------

anEngine = nextLoco()
if anEngine == ("Thomas", 1, "0-6-0") {
    print ("found our missing Thomas")
}

