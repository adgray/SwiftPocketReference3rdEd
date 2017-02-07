// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Dictionaries
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------



#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



var cpus = ["BBC Model B":"6502", "Lisa":"68000", "TRS-80":"Z80"]
let cpusMaster = cpus



// ------------------------------------------
// Accessing Dictionary Elements
// ------------------------------------------

let cpu = cpus["BBC Model B"]



// ------------------------------------------
// Dictionary Properties
// ------------------------------------------

cpus.count
cpus.isEmpty



// ------------------------------------------
// Modifying a Mutabale Dictionary
// ------------------------------------------

cpus["Macintosh"] = "PowerPC"
cpus

let oldValue = cpus.updateValue("x86", forKey:"Macintosh")
cpus

let (k1, v1) = cpus.popFirst()!
k1
v1
cpus

cpus.removeAll()

cpus = cpusMaster
let removedValue = cpus.removeValue(forKey: "Lisa")
cpus



// ------------------------------------------
// Iterating Over A Dictionary
// ------------------------------------------

cpus = cpusMaster
print ("\n-iterating over a dictionary")
for (make, processor) in cpusMaster {
    print ("The", make, "is powered by the", processor, "microprocessor")
}

print ("\n-iterating over a dictionary's values")
for processor in cpusMaster.values {
    print (processor)
}



// ------------------------------------------
// Dictionary Inherited Functionality
// ------------------------------------------

var end = cpusMaster.endIndex
var start = cpusMaster.startIndex
start == end


print ("\n-contains")
if cpus.contains(where: { $0.key == "BBC Model B" } ) {
    print ("match found")
}

print ("\n-dropFirst")
let subset1 = cpusMaster.dropFirst()
for (key, value) in subset1 {
    print ("key: ", key, ", value: ", value)
}

print ("\n-dropLast")
let subset2 = cpusMaster.dropLast()
for (key, value) in subset2 {
    print ("key: ", key, ", value: ", value)
}

print ("\n-forEach")
cpusMaster.forEach { print ($0.0, "has a", $0.1) }


print ("\n-index(forKey:)")
cpus = cpusMaster
if let i = cpus.index(forKey: "Lisa")
{
    print (cpus[i])
}


print ("\n-index(where:)")
if let idx = cpus.index(where: {$0.key.hasPrefix("L") } ) {
    print ("found at", cpus[idx])
}


let keys = [String](cpus.keys)


var pos = cpus.startIndex
let (k2, v2) = cpus.remove(at: cpus.index(after: pos))
k2
v2
cpus


let values = [String](cpus.values)



// --------------------------------------------
// Brigding between Dictionary and NSDictionary
// --------------------------------------------

import Foundation
(cpus as NSDictionary).write(toFile:"/tmp/someDict", atomically: true)





