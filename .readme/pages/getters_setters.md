<a href="../../README.md">
<img 
src="../../.readme/assets/codeacademy-white.svg" 
height="42">
</a>

## Getters and setters

#### Automatically Generated Getters and Setters
When an instace property is defined in Swift using var, a getter and setter is automatically generated:
```Swift
class Hoverboard {
    var antigravity = false
}

let board = Hoverboard()
board.antigravity = true // Set the value
print(board.antigravity) // Get the value
```

When an instance is defined using <code>let</code>, only getter is available
```Swift
class Ball {
    let material = "Plastic"
}

let ball = Ball() 
print(ball.material)
```

#### Getter (get)
One way to stop value to being set is to use <code>private(set)</code> to make set unaccessible:
```Swift
class Hoverboard {
    private(set) var antigravity = true
}

let board = Hoverboard()
board.antigravity = false // Will not compile, 
// setters is not accessible
```

Another way to do this is to expose getter with a get
```Swift
class Hoverboard {
    private var _antigravity = true
    var antigravity: Book {
        get { return _antigravity}
    }
}

let board = Hoverboard()
board.antigravity = false // Will not compile, 
// antigravity is a get-only property
```

#### get throws (Swift 5.5)
Starting from Swift 5.5, <code>throws</code> is available for getters define with <code>get</code>:
```Swift
class Ticket {
    func isConnectionAvailable() throws -> 
    Bool {
        /* ... */
    }

    can canPurchase: Bool {
        get throws {
            return try isConnectionAvailable()
        }
    }
}

let ticker = Ticket()

do {
    if try ticket.canPurchase {
        // logic handle
    }
}
catch {
    // error handle
}
```
#### Setter (get)
The <code>set</code> keyword can be used to implement an explicit setter in Swift. Often <code>set</code> is used to expose a setter for a private property and apply additional logic:
```Swift
class Ticket {
    func isBalanceEnough() -> Bool {
        /* ... */
    }

    private var isTicketValid = false

    func canPurchase: Bool {
        get { return isTicketValid }
        set { if isBalanceEnough() {
            isTicketValid = true
        }
    }
}
```

#### willSet
If explicit getters and setters using <code>get</code> and <code>set</code> are not defined, <code>willSet</code> can be used to take action **before** a new value is set for a property:
> 'willSet' cannot be provided together with a getter

> 'willSet' cannot be provided together with a setter,
it should be instead implemented inside of the <code>set</code> setter
```Swift
class Hoverboard {
    func storePreviousTime(_ time: Date) {
        // obtain time hovering
    }
    var time = 0 {
        willset {
            storePreviousValue(time)
        }
    }
}
```

#### didSet
If explicit getters and setters using <code>get</code> and <code>set</code> are not defined, <code>didSet</code> can be used to action **after** a new value is set for a property
> 'didSet' cannot be provided together with a getter

> 'didSet' cannot be provided together with a setter,
it should be instead implemented inside of the <code>set</code> setter
```Swift
class Hoverboard {
	@IBOutlet weak var hoverIndicator: UIView!

	var time = 0 {
		didSet {
			hoverIndicator.backgoundColor = .green
		}
	}
}
```

---
Source: [AdvancedSwift](https://www.advancedswift.com/getters-setters-swift/)

