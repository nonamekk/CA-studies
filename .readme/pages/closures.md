<a href="../../README.md">
<img 
src="../../.readme/assets/codeacademy-white.svg" 
height="42">
</a>

## Closure expressions
[*Closure expressions*](https://docs.swift.org/swift-book/LanguageGuide/Closures.html#ID95) are unnamed closures with a more lightweight syntax suit brief inline and focuses used. Closure expressions **provide several syntax optimizations for writing closures in a shortened from** without loss of clarity or intent.

There are many functions and methods in iOS that take a closure as one of their arguments.

For example, the view animate function takes a closure that containing the changes to commit to the views when animate.

```Swift
class func animate(withDuration duration: TimeInterval, 
        animations: @escaping () -> Void)
```

Or the filter method, which takes a function that takes an element of the sequence as its argument and returns a boolean value indicating whether the element should be included in the returned array or not.

```Swift
func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> [Self.Element]
```

The examples will start with the **longest form to the shortest one**.

#### General form
```Swift
{ (parameters) -> return type in
    statements
}
```

#### Infering Type from Context
Because the closure is passed as an argument method, Swift can infer the types of its parameters and the tupe of the value it returns from that method.

We can omit the return typem the arrow (->), parmaterers type, and the parentheses around those inputs.

```Swift 
scores.filter { score in 
    return score > 5
}

scores.sorted {lhsm rhs in 
    return lhs > rhs
}
```

#### Implicit Returns from Single-Expression Closures
Keyword <code>return</code> can be omitted when one expression is used.

```Swift
scores.filter { score in score > 5 }

scores sorted { lhs, rhs in lhs > rhs }
```

#### Shorthand Argument Names

Swift automatically provides shorthand argument names **if you omit closure's argument list from the definition**.

The shorthand arguments are named after the position of closure's arguments. It will be in this format <code>$[position of parameters]</code>, a dollar sign follows an argument position, e.g., $0, $1, $2.
> The first position starts at zero ($0) indexes.

```Swift 
// scores.filter { score in score > 5 }
scores.filter { $0 > 5 }

// scores.sorted { lhs, rhs in lhs > rhs }
scores.sorted { $0 > $1 }
```

> Generate shorthand arguments only if you don't declare an explicit argument list. 

This won't work: 
```Swift
scores.filter { score in $0 > 5 }
```

#### Operator Methods
Swift documentation put this under the shortest form of clousre expression, but I think of it the same way as using [function](https://sarunw.com/posts/different-ways-to-pass-closure-as-argument/#function) as an argument.

Int type overrides the greater-than operator (<code>></code>) to work with its type. If you open up an intergace file, you will see something like this.

```Swift
@frozen public struct Int: FixedWidthInteger, SignedInteger {
    public static func > (lhs: Int, rhs: Int) -> Bool
}
```

<code>></code> is a method with two parameters of type <code>Int</code> and returns a value of type <code>Bool</code>. This matches the method type needed by the <code>sorted(by:)</code> method, so we can use the method name, <code>></code> as an argument.

```Swift
scores.sorted(by: >)
```

#### Key path

Key Path expression <code>\Root.value</code> can be used where functions of <code>(Root) -> Value</code> are allowed.

```Swift
extension Int {
    var greaterThanFive: Bool {
        return self > 5
    }
}
```

This <code>\Int.greaterThanFive</code> can be translated into <code>(Int) -> Bool</code>, which matches the <code>filter</code> signature, so we can use it as its argument.

```Swift
scores.filter(\.greaterThanFive)
```


---
Source: [Sarunw](https://sarunw.com/posts/different-ways-to-pass-closure-as-argument/)