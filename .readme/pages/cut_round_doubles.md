<a href="../../README.md">
<img src="../../.readme/assets/codeacademy-white.svg" height="42">
</a>

## Removing numbers after separator in <code>Double</code> numbers
The idea, that if would want to remove some numbers in <code>Double</code> value, it would get rounded. Example: 
```swift
	let number: Double = 0.99999999999
	print(String(format: "%.2f", number)) // Output: 1.00
```

> Quacking: Couldn't find any method to do numbers after separator removal by only addressing number types, so only possible with using <code>String</code> type as it seems.

Quick list of actions:
- Convert number to <code>String</code>.
- Half the number into two, separated by the dot.
- Remove from last characters of <code>String</code> for the ammount of numbers aiming for.
- Combine everything into one <code>String</code> and convert to <code>Double</code>

```swift
import Foundation
func roundCutDouble(_ number: Double, to afterDot: UInt) -> Double {
    var doubleString = String(number)
    if (doubleString.contains(".")) {
        
        var separatedNumber = doubleString.components(separatedBy: ".")
        
        var secondHalf: String = separatedNumber[1]
        
        if secondHalf.count > afterDot {
            secondHalf = String(
                secondHalf.dropLast(
                    secondHalf.count - Int(afterDot)
                )
            )
        }
        
        let fullNumberString: String = "\(separatedNumber[0]).\(secondHalf)"
        
        let fullNumber: Double = Double(fullNumberString)!
        return fullNumber
    }
    return number
}

```

And so in the end:
```swift
let arrayOfNumbers: [Double] = [
    0.99999999999,
    1231231.799999997,
    20.299999999999997
]

print(roundCutDouble(arrayOfNumbers[0], to: 0))     // -> 0.0
print(roundCutDouble(arrayOfNumbers[1], to: 2))     // -> 1231231.79
print(roundCutDouble(arrayOfNumbers[2], to: 6) + 2) // -> 22.299999
```
