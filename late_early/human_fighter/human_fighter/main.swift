//
//  main.swift
//  human_fighter
//
//  Created by nonamekk on 2022-10-27.
//

import SwiftUI
import Foundation

extension Human {
    func compare(with human: Human) {
        let comparison = self.strenght - human.strenght
        if comparison > 0 {
            print("Human's strength compared to is stronger than human compared with by: \(comparison)")
        } else if comparison < 0 {
            print("Human's strength compared to is weaker than human compared with by: \(comparison * -1)")
        } else {
            print("Humans have equal strength")
        }
    }
}

protocol Comparable {
    func compare(human: Human)
}

Medic().compare(with: Scout())

protocol Describable {
    func describe()
}

extension Int: Describable {
    func describe() {
        print("This is Int, that is a signed integer value type, holding value: \(self)")
    }
    
}

extension Double: Describable {
    func describe() {
        print("This is a Double type, that is a double-precision floating value type, holding value: \(self)")
    }
    
}

extension String: Describable {
    func describe() {
//        return String(describing: self)
        print("This is a String type, that is a Unicode string value that is a collection of characters, holding value: \(self)")
    }
}

class Human {
    var hitpoints: Double
    var speed: UInt
    var strenght: Double
    
    init(hitpoints: Double, speed: UInt, strength: Double) {
        self.hitpoints = hitpoints
        self.speed = speed
        self.strenght = strength
    }
    
    func run(force: UInt) -> Double {
        return Double(force)/Double(speed)
    }
    
    func rest() {
        if hitpoints < 100 {
            hitpoints += 10
            if hitpoints > 100 {
                hitpoints = 100
            }
        }
    }
    
    func melee(human: Human) -> Human {
        if human.hitpoints >= self.strenght {
            human.hitpoints -= self.strenght
        } else {
            human.hitpoints = 0
        }
        
        return human
    }
    
    func attack(_ human: Human) -> Human? {
        // Override in subclasses
        return nil
    }
}

class Marine: Human {
    init() {
        super.init(hitpoints: 0, speed: 20, strength: 10)
    }
    
    override func attack(_ human: Human) -> Human {
        human.hitpoints -= self.strenght * 3
        
        if human.hitpoints < 0 {
            human.hitpoints = 0
        }
        
        return human
    }
}

class Scout: Human {
    init() {
        super.init(hitpoints: 0, speed: 70, strength: 7)
    }
    
    override func attack(_ human: Human) -> Human {
        human.hitpoints -= self.strenght * 1.5
        
        if human.hitpoints < 0 {
            human.hitpoints = 0
        }
        
        return human
    }
}


class Medic: Human {
    init() {
        super.init(hitpoints: 0, speed: 35, strength: 3)
    }
    
    override func attack(_ human: Human) -> Human {
        return self.melee(human: human)
    }
    
    func heal(_ human: Human) -> Human {
        if human.hitpoints < 100 {
            human.hitpoints += 25
        }
        
        return human
    }
}

class Testing {
    
    var human: Human
    
    init(_ human: Human) {
        self.human = human
        
        heal()
        attack()
        rest()
        run()
    }
    
    func heal() {
        let healer = Medic()
        self.human = healer.heal(self.human)
        assert(self.human.hitpoints == 25, "Human is healed")
    }
    
    func attack() {
        var dummyTarget = Human(hitpoints: 100, speed: 0, strength: 0)
        dummyTarget = self.human.attack(dummyTarget)!
        assert(dummyTarget.hitpoints < 100, "Human attacked dummy target")
    }
    
    func rest() {
        if self.human.hitpoints == 100 {
            assertionFailure("Not possible to test rest for human")
        } else {
            let prevHP = self.human.hitpoints
            self.human.rest()
            assert(human.hitpoints - prevHP == 10 || human.hitpoints == 100, "Human rested")
        }
        
    }
    
    func run() {
        let distance = roundCutDouble(Double(self.human.run(force: 100)), to: 2)
        assert(UInt(100 / distance) == self.human.speed, "Human runned")
    }
}


let _ = Testing(Marine())
print("✅ 1/3: Marine was successfully tested")
let _ = Testing(Scout())
print("✅ 2/3: Scout was successfully tested")
let _ = Testing(Medic())
print("✅ 3/3: Medic was successfully tested")

func roundCutDouble(_ number: Double, to afterDot: UInt) -> Double {
    let doubleString = String(number)
    if (doubleString.contains(".")) {
        
        let separatedNumber = doubleString.components(separatedBy: ".")
        
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

// Extensions

extension String {
    func trimSpaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    func separateByDash() -> String {
        return components(separatedBy: .whitespaces).joined(separator: "-")
    }
}


extension Double {
    func half() -> Double {
//        return roundCutDouble(self/2, to: 6)
        return self/2
    }
}

//print("Text text text".trimSpaces())
//print("Text text text".separateByDash())
//print(2.32.half())

class Rectangle {
    var width: Double
    var height: Double
    
    init(_ width: Double, _ height: Double) {
        self.width = width
        self.height = height
    }
    
    func outputSizes() {
        print("Rectangle: \(self.width)/\(self.height)")
    }
}

extension Rectangle: FigureViewing {
    var area: Double {
        return self.width * self.height
    }
    
    var perimeter: Double {
        return (self.width + self.height)*2
    }
}

let figure = Rectangle(200.2, 200.5)

//print(figure.area)
//print(figure.perimeter)


// Protocol

// Will include a class, obliging it to have functions listed with the same name - Protocol
// the class itself can have other functions, but listed are required
// Example: Listing of classes that are same, can be appended into one array, using the protocol
protocol FigureViewing {
    func outputSizes()
}

let intValue: Int = 1
let doubleValue: Double = 0.12
let stringValue: String = """
    Reading the text, saying words and making sentences
    doesn't always mean you correctly interpret them,
    as morals of the mind allow implication and simplification of it
"""
let valuesToDescribe: [Describable] = [intValue, doubleValue, stringValue]


for each in valuesToDescribe {
    each.describe()
}
