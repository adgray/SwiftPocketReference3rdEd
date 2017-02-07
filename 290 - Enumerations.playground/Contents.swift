// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Enumerations
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



enum TravelClass {
    case first
    case business
    case economy
    
    var a: Int {
        get { return 6 }
    }
}


enum TravelClassBrief {
    case first, business, economy
}


let thisTicket = TravelClass.first
let thatTicket: TravelClass
thatTicket = .economy




// ------------------------------------------
// Raw Member Values
// ------------------------------------------

enum AtomicNumber: Int {
    case hydrogen = 1
    case helium = 2
    case lithium = 3
    case beryllium = 4
}


enum AtomicNumberBrief: Int {
    case hydrogen = 1, helium, lithium, beryllium
}


AtomicNumber.lithium.rawValue
// returns 3

let mysteryElement = AtomicNumber.helium
mysteryElement.rawValue
// returns 2


if let r = AtomicNumber(rawValue: 2) {
    print (r)
} else {
    print ("there was no matching member for the raw value 2")
}


var s: String
if let r = AtomicNumber(rawValue: 3) {
    s = "\(r)"
} else {
    s = ""
}




// ------------------------------------------
// Associated Values
// ------------------------------------------

enum NetworkAddress {
    case mac(String)
    case ipv4(UInt8, UInt8, UInt8, UInt8)
}


var routerAddress = NetworkAddress.ipv4(192, 168, 0, 1)
var dnsServerAddress = NetworkAddress.ipv4(8, 8, 8, 8)
var ethernetIF = NetworkAddress.mac("00:DE:AD:BE:EF:00")


var someAddress = NetworkAddress.ipv4(192, 168, 0, 1)
someAddress = NetworkAddress.mac("00:DE:AD:BE:EF:00")
someAddress = NetworkAddress.ipv4(10, 10, 0, 1)


someAddress = NetworkAddress.ipv4(10, 10, 0, 1)
switch someAddress {
case .mac:
    print ("got a MAC address")
case .ipv4:
    print ("got an IP address")
}
// prints "got an IP address"


someAddress = NetworkAddress.mac("00:DE:AD:BE:EF:00")
switch someAddress {
case let .mac(theaddress):
    print ("got a MAC address of \(theaddress)")
case let .ipv4(a, b, c, d):
    print ("got an IP address with" +
        "a low octet of \(d)")
}
// prints "got a MAC address of 00:DE:AD:BE:EF:00"




// ------------------------------------------
// Methods in Enumerations
// ------------------------------------------

enum NetworkAddress2 {
    case mac(String)
    case ipv4(UInt8, UInt8, UInt8, UInt8)
    
    func printable() -> String
    {
        switch self {
        case let .mac(theAddress):
            return theAddress
        case let .ipv4(a, b, c, d):
            return ("\(a).\(b).\(c).\(d)")
        }
    }
}

var deviceAddress = NetworkAddress2.ipv4(192, 168, 0, 1)
deviceAddress.printable()
// returns "192.168.0.1"
deviceAddress = NetworkAddress2.mac("00:DE:AD:BE:EF:00")
deviceAddress.printable()
// returns "00:DE:AD:BE:EF:00"




// -------------------------------------------
// Type Methods and Properties in Enumerations
// -------------------------------------------

enum TravelCode {
    case red
    case gold
    case platinum

    static func printSomething() {
        print ("static method called and someValue is ", TravelCode.someValue)
    }
    
    static var someValue = 5
}

var myCode = TravelCode.red
TravelCode.someValue = 9
TravelCode.printSomething()




// ------------------------------------------
// Recursive Enumerations
// ------------------------------------------

indirect enum List {
    case empty
    case subList(head: Int, tail: List)
}

let list1 = List.subList(head: 4, tail: List.empty)
let list2 = List.subList(head: 1, tail: list1)
let list3 = List.subList(head: 2, tail: list2)
print (list3)




