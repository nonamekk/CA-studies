//
//  main.swift
//  outputs
//
//  Created by Admin on 2022-09-22.
//

import Foundation

// Lecture 2
//
// Declaring constants and variables
// Type Annotations
// Changing variable value
// Comments
// Arrays
// Dictionaries
//
// Other Sources:
// - https://stackoverflow.com/a/27766320
// - https://www.advancedswift.com/comments-documentation-swift/


var integersArray = [Int]()
var names = [Int: String]()
var names_opposite: [String: Int] = [String: Int]()

integersArray.append(1)
integersArray[0] = 2
names[0] = "Jonas"
names_opposite["Lukas"] = 9


/// Prints greeting with the name
func toOutput(_ name: String) {
    print("sveiki \(name)")
}

/// Prints greeting by checking the names dictionary key value for the name to match
func toOutputWhenName(_ names: [String: Int], _ to_match: String) {
    for each in names {
        if each.key == to_match {
            toOutput(each.key)
        }
    }
}

/// Checks if the first number is divisable by the second number
///
/// ## Example ##
/// ```
/// isNumberDivisable(4,2) // true
/// ```
///
/// - Parameters:
///     - a: divident
///     - b: divisor
/// - Returns: true if the number can be divised by divisor, false if not
func isNumberDivisable(_ a: Int, _ b: Int) -> Bool {
    if a % b == 0 {
        return true
    }
    return false
}

/// Depending on the parameter returns the divisable/undivisable text
///
/// ## Example ##
/// ```
/// whichPartTextDivisable(true) // "is divisable by"
/// ```
///
/// - Parameters:
///     - res: subject of the decision
/// - Returns  "is divisable by" or "is undivisable by"
func whichPartTextDivisable(res: Bool) -> String {
    if res {
        return "is divisable by"
    } else {
        return "is undivisable by"
    }
}

/// Prints out the text result if and which the numbers are divisable
///
/// ## Example ##
/// ```
/// divisableNumbersPrint(8,4) // prints out 8 is divisable by 4
/// ```
/// - Parameters:
///     - a: divident
///     - b: divisor
func divisableNumbersPrint(a: Int, b: Int) {
    let divRes = isNumberDivisable(a, b)
    let printPart = whichPartTextDivisable(res: divRes)
    print("\(a) \(printPart) \(b)")
    
}

toOutput(names[0]!)
toOutputWhenName(names_opposite, "Lukas")
divisableNumbersPrint(a: 9, b: 3)
