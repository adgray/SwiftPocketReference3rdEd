// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Closures
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// default sort (of Arrays)
let names = ["John", "Zoe", "Laura", "albert", "Allen"]
let s = names.sorted()
// s is now ["Allen", "John", "Laura", "Zoe", "albert"]



// sorted() using a closure - fully specified
let t1 = names.sorted (by:
    { (s1: String, s2: String) -> Bool in
        return s1<s2 }
)

// sorted() using a closure - with inferred parameter types
let t2 = names.sorted { (s1, s2) -> Bool in return s1<s2 }
t2


// sorted() using a closure - omitting return
let t3 = names.sorted { s1, s2 in s1<s2 }
t3


// sorted() using a closure - reversing the sort
let t4 = names.sorted { s1, s2 in s2<s1 }
t4


// sorted() using a closure - alternate way of reversing the sort
let t5 = names.sorted { s1, s2 in s1>=s2 }
t5


// sorted() using a closure - using string length
let t6 = names.sorted { s1, s2 in
    s1.characters.count  < s2.characters.count }
t6



// ------------------------------------------
// Automatic Argument Names
// ------------------------------------------

let u1 = names.sorted { $0 < $1 }
let u2 = names.sorted { $1 < $0 }
let u3 = names.sorted { $0.characters.count  < $1.characters.count }
u1
u2
u3



// ------------------------------------------
// Trailing Closures
// ------------------------------------------

let v1 = names.sorted() { $0 < $1 }
let v2 = names.sorted() { $1 < $0 }
let v3 = names.sorted() { $0.characters.count  < $1.characters.count }
v1
v2
v3

let w1 = names.sorted { $0 < $1 }
let w2 = names.sorted { $1 < $0 }
let w3 = names.sorted { $0.characters.count  < $1.characters.count }
w1
w2
w3



// ------------------------------------------
// Capturing Values
// ------------------------------------------

func makeTranslator(_ greeting: String) -> (String) -> String
{
    return {
        (name: String) -> String in
        return (greeting + " " + name)
    }
}

var englishWelcome = makeTranslator("Hello")
var germanWelcome = makeTranslator("Guten Tag")

englishWelcome ("Bill")
// returns "Hello Bill"
germanWelcome ("Johan")
// returns "Guten Tag Johan"

englishWelcome = makeTranslator("G'day")
englishWelcome ("Bruce")
// returns "G'day Bruce"



// ------------------------------------------
// Capturing Values by Reference
// ------------------------------------------

func makeCountingTranslator(_ greeting: String, _ personNo: String) -> (String) -> String
{
    var count = 0
    
    return {
        (name: String) -> String in
        count += 1
        return ("\(greeting) \(name), \(personNo) \(count)")
    }
}

var germanReception = makeCountingTranslator("Guten Tag", "Sie sind Nummer")
var aussieReception = makeCountingTranslator("G'day", "you're number")

germanReception ("Johan")
// returns "Guten Tag Johan, Sie sind Nummer 1"
aussieReception ("Bruce")
// returns "G'day Bruce, you're number 1"
aussieReception ("Kylie")
// returns "G'day Kylie, you're number 2"



// ------------------------------------------
// @escaping Attribute
// ------------------------------------------

var storedClosure: () -> Void = {}
var value = "empty"

func saveClosure(closure: @escaping () -> Void)
{
    storedClosure = closure
}

print ("initial:", value)
saveClosure { value = "closure executed" }
print ("after saving closure:", value)
storedClosure()
print ("after executing:", value)



// ------------------------------------------
// @autoclosure Attribute
// ------------------------------------------

let autoA = 23
let autoB = 56

func evaluate(_ predicate: @autoclosure () -> Bool)
{
    if predicate() {
        print ("we have a match")
    }
}

evaluate(autoA < autoB)



