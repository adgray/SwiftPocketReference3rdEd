// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Generics
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// ------------------------------------------
// Generic Types
// ------------------------------------------

var s1 = 45.0
var s2 = 60.0
swap (&s1, &s2)
s1
s2


struct Queue<T>
{
    var entries = [T]()
    
    mutating func enqueue(_ item: T)
    {
        entries.append(item)
    }
    
    mutating func dequeue() -> T
    {
        return entries.remove(at: 0)
    }
}


var q1 = Queue<Int>()
q1.enqueue(45)
q1.enqueue(39)
q1.enqueue(61)
q1.enqueue(98)
print(q1.entries)
// prints  [45, 39, 61, 98]

q1.dequeue()
// returns 45

print(q1.entries)
// prints [39, 61, 98]



// ------------------------------------------
// Constraining Types
// ------------------------------------------

struct SignedQueue<T: SignedInteger>
{
    var entries = [T]()
    
    mutating func enqueue(item: T)
    {
        entries.append(item)
    }
    
    mutating func dequeue() -> T
    {
        return entries.remove(at: 0)
    }
}

// var q2 = SignedQueue<UInt>()
// error –
// Type 'UInt' does not conform to protocol 'SignedInteger'


func merge<T:Comparable>(_ a:[T], _ b:[T]) -> [T]
{
    var output = [T]()
    var a = a       // make mutable copies of parameters
    var b = b
    
    output.reserveCapacity(a.count + b.count)
    
    while !a.isEmpty && !b.isEmpty {
        if a[0] < b[0] { output.append(a.remove(at: 0)) }
        else { output.append(b.remove(at: 0)) }
    }
    
    while !a.isEmpty { output.append(a.remove(at: 0)) }
    while !b.isEmpty { output.append(b.remove(at: 0)) }
    
    return output
}


let s = ["allan", "fred", "mike"]
let t = ["brenda", "geraldine", "ruth"]
let u = merge(s, t)
u
// returns "allan", "brenda", "fred",
// "geraldine", "mike", "ruth"

let v = [3, 9, 17, 21]
let w = [1, 2, 12, 36]
let x = merge(v, w)
x



// ------------------------------------------
// Constraining types with where claise
// ------------------------------------------

struct SortedArray<T> where T:Comparable
{
    var elements: [T] = []
    
    init<U>(_ sequence: U) where
        U:Sequence,
        U.Iterator.Element == T
    {
        elements = sequence.sorted()
    }
    
    // binary search elements for specific value
    private func bsearch(_ value: T) -> Int
    {
        guard !elements.isEmpty else { return 0 }
        
        var middle = 0, lower = 0
        var upper = elements.count - 1
        
        while lower < upper {
            middle = (lower + upper) >> 1
            if elements[middle] < value { lower = middle + 1 }
            else { upper = middle }
        }
        if (elements[lower] < value) { return lower+1 }
        return lower
    }
    
    mutating func insert(_ value: T)
    {
        elements.insert(value, at: bsearch(value))
    }
}


var sortedNums = SortedArray([15, 3, 9, 7])
sortedNums.insert(13)
sortedNums.elements

var sortedNames = SortedArray(["Wilma", "Albert"])
sortedNames.insert("Geraldine")
sortedNames.elements




// ------------------------------------------
// Generic Protocols
// ------------------------------------------

protocol Queueable
{
    associatedtype NativeType
    mutating func enqueue(_ item: NativeType)
    mutating func dequeue() -> NativeType
}


struct StringList: Queueable
{
    var list = [String]()
    typealias NativeType = String
    
    mutating func enqueue(_ item: NativeType)
    {
        list.append(item)
    }
    
    mutating func dequeue() -> NativeType
    {
        return list.remove(at: 0)
    }
}


var sl = StringList()
sl.enqueue("Joshua")
sl.enqueue("Nadia")
sl.enqueue("Paul")
sl.dequeue()
// returns "Joshua"
print(sl.list)
// prints ["Nadia", "Paul"]


