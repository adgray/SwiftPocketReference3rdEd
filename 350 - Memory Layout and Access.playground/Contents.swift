// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Memory Layout & Access
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif


import Foundation


// ---------------------------------------------------------------
// Typed access to raw memory
// ---------------------------------------------------------------


// Reading from a file

// allocate a memory buffer of 1024 C-Characters
let blockSize = 1024
var buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: blockSize)
dump(buffer)

// use fread() to read a file into the buffer
let inputFile = fopen("/etc/hosts", "r")
var bytes = fread(buffer, 1, blockSize, inputFile)
fclose(inputFile)

print (bytes, "bytes read")

print ("first char:", buffer[0])
print (buffer.pointee)

var fileContents = ""
for i in 0..<bytes {
    fileContents.append(Character(UnicodeScalar(buffer[i])))
}

buffer.deallocate(capacity: blockSize)
print (fileContents)





// Listing the contents of a directory

var dirEntry: UnsafeMutablePointer<dirent>?
var dirPtr: UnsafeMutablePointer<DIR>?

dirPtr = opendir(".")

repeat {
    dirEntry = readdir(dirPtr)
    if let dir = dirEntry {
        withUnsafePointer(to: &dir.pointee.d_name, { ptr in
            let ptrStr = unsafeBitCast(ptr, to: UnsafePointer<CChar>.self)
            let name = String(cString: ptrStr)
            print("\(name)")
        })
    }
} while dirEntry != nil






// Creating an array of Ints via Unsafe memory access

let arrSize = 20
var intArr = UnsafeMutablePointer<Int>.allocate(capacity: arrSize)
for i in 0..<arrSize {
    intArr[i] = i * i
}
// do some work
// release
intArr.deallocate(capacity: arrSize)




// Accessing Int via UnsafePointer

func takesPtr(_ ptr: UnsafePointer<Int>) {
    print (ptr.pointee)
}

var intVal = 64
takesPtr(&intVal)





// ---------------------------------------------------------------
// Memory Layout (replaced global functions in Swift 2)
// ---------------------------------------------------------------

// set up some things we'll use later
struct S1 {
    var i = 0
    var x = 1.0
    var b = false
    var c = true
    var d = false
}


// alignment of types - replaces alignof(type) from Swift 2
let alignVar1 = MemoryLayout<Int>.alignment    // Int aligns to 8 bytes
let alignVar2 = MemoryLayout<Int8>.alignment   // Int8 aligns to 1 byte
let alignVar3 = MemoryLayout<Double>.alignment // Double aligns to 8 bytes



// alignment of values - replaces alignofValue(value) from Swift 2
let alignVar4 = MemoryLayout.alignment(ofValue: "Hello")  // Strings align to 8
let alignVar5 = MemoryLayout.alignment(ofValue: Int16(1)) // Int16s align to 2


// size of types - replaces sizeof(Type) from Swift 2
var s1inst = S1()

let sizeofVar1 = MemoryLayout<Int>.size    // Int requires 8 bytes
let sizeofVar2 = MemoryLayout<Int8>.size   // Int8 requires  1 byte
let sizeofVar3 = MemoryLayout<Double>.size // Double requires 8 bytes
let sizeofVar4 = MemoryLayout<S1>.size     // Struct requires size of properties


// size of values - replaces sizeofValue(x) from Swift 2
let sizeofVar5 = MemoryLayout.size(ofValue: 2)        // Int requires 8 bytes
let sizeofVar6 = MemoryLayout.size(ofValue: Int8(2))  // Int8 requires  1 byte
let sizeofVar7 = MemoryLayout.size(ofValue: 4.5)      // Double requires 8 bytes
let sizeofVar8 = MemoryLayout.size(ofValue: s1inst)   // Struct requires size of properties



// stride of types - replaces strideof(Type) from Swift 2
let strideofVar1 = MemoryLayout<Int>.stride    // Int stride is 8 bytes
let strideofVar2 = MemoryLayout<Int8>.stride   // Int8 stride  1 byte
let strideofVar3 = MemoryLayout<Double>.stride // Double stride 8 bytes
let strideofVar4 = MemoryLayout<S1>.stride     // Struct stride is size of properties, rounded up to next multiple of 8



// stride of values - replaces strideofValue(x) from Swift 2
let strideofVar5 = MemoryLayout.stride(ofValue: 2)       // Int stride is 8 bytes
let strideofVar6 = MemoryLayout.stride(ofValue: Int8(2)) // Int8 stride is 1 byte
let strideofVar7 = MemoryLayout.stride(ofValue: 4.5)     // Double stride is 8 bytes
let strideofVar8 = MemoryLayout.stride(ofValue: s1inst)  // Struct stride is size of properties, rounded up to next multiple of 8





