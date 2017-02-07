// ---------------------------------------------------------------
// Swift Pocket Reference 3rd Edition by Anthony Gray
// Code updates at github.com/adgray/
// ---------------------------------------------------------------
// Floating Point Protocol
// Code samples in this file may produce "unused" warnings in
// Swift 3 when used in scripts or regular code.
// No such warnings are generated in Playgrounds (by design).
// ---------------------------------------------------------------


#if !swift(>=3.0)
    print("Warning: intended for Swift 3 or higher")
#endif



// ------------------------------------------------------
// Floating point type properties
// ------------------------------------------------------

Float.greatestFiniteMagnitude
Float.infinity
Float.leastNonzeroMagnitude
Float.leastNonzeroMagnitude
Float.nan
Float.pi
Float.signalingNaN
Float.ulpOfOne

Double.greatestFiniteMagnitude
Double.infinity
Double.leastNonzeroMagnitude
Double.leastNonzeroMagnitude
Double.nan
Double.pi
Double.signalingNaN
Double.ulpOfOne

Float80.greatestFiniteMagnitude
Float80.infinity
Float80.leastNonzeroMagnitude
Float80.leastNonzeroMagnitude
Float80.nan
Float80.pi
Float80.signalingNaN
Float80.ulpOfOne



// ------------------------------------------------------
// Floating point instance methods
// ------------------------------------------------------

4.45.rounded()
4.50.rounded()
4.45.rounded(.down)
4.45.rounded(.up)

4.000000000001.rounded(.up)


4.5.rounded(.toNearestOrAwayFromZero)
4.5.rounded(.toNearestOrEven)
4.5.nextDown

Float.pi
Double.pi
Float80.pi
Float.radix
Float.infinity
4.5.floatingPointClass

var f = 4.5
f.floatingPointClass

32.457.exponent

var t = 2.4e6
Float80.radix
Float.ulpOfOne
Double.ulpOfOne

print (Float.nan)
print (Float.signalingNaN)

Float.maximum(2.3, -3.5)
Float.maximumMagnitude(2.3, -3.5)

(-4.5).rounded(.awayFromZero)
4.5.rounded(.awayFromZero)

(-4.5).rounded(.down)
4.5.rounded(.down)



