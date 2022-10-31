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



/// Prints out the text if divident is divisable or not divisable to the divisor
///
/// ## Example ##
/// ```
/// divisableNumbersPrint(8,4) // prints out 8 is divisable by 4
/// ```
/// - Parameters:
///     - a: divident
///     - b: divisor
func isNumberDivisable(_ a: Int, _ b: Int) -> () {
//    let divRes: Bool = isNumberDivisable(a, b)
//    let printPart: String = isNumberDivisable(divRes)
//    print("\(a) \(printPart) \(b)")
//
    print("\(a) \(isNumberDivisable(isNumberDivisable(a, b))) \(b)")
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
    return a % b == 0
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
func isNumberDivisable(_ isDivisable: Bool) -> String {
    return isDivisable ? "is divisable by" : "is undivisable by"
}

toOutput(names[0]!)
toOutputWhenName(names_opposite, "Lukas")

let _: () = isNumberDivisable(9, 3)
