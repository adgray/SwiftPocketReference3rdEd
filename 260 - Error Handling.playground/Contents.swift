// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Program Flow - Error Handling
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// ------------------------------------------
// do-try-catch
// ------------------------------------------


enum InputError: Error
{
    case notAnInt
    case notAFloat
}

func sumOfInts(in strings: [String]) throws -> Int
{
    var tot = 0
    for str in strings {
        guard let strAsInt = Int(str) else {
            throw InputError.notAnInt
        }
        tot += strAsInt
    }
    return tot
}


func showCatch(_ nums: [String])  // <====================
{
    do
    {
        let result = try sumOfInts(in: nums)
        print ("Sum of ints is", result)
    }
    catch InputError.notAnInt
    {
        print ("Input error: string not an integer literal")
    }
    catch
    {
        print ("Some other error occured")
    }
}

showCatch(["12", "24", "8", "17"])
showCatch(["3", "15", "5.4"])
showCatch(["3", "15", "6"])



// ------------------------------------------
// forced try
// ------------------------------------------

try! sumOfInts(in: ["12", "24", "8", "17"])
// try! sumOfInts(in: ["3", "0.4"]) // will give runtime error



// ------------------------------------------
// optional try
// ------------------------------------------

try? sumOfInts(in: ["12", "24", "8", "17"]) // returns 61
try? sumOfInts(in: ["3", "0.4"]) // returns nil


func sumOfInts1(in strings: [String]) throws -> Int?
{
    var tot = 0
    for str in strings {
        guard let strAsInt = Int(str) else {
            return nil
        }
        tot += strAsInt
    }
    return tot
}

let sum = try? sumOfInts1(in: ["3", "5", "8"])
// sum is of type Int??
if let outersum = sum,
    let innersum = outersum {
    print ("Sum of ints is", innersum)
}


