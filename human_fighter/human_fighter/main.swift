//
//  main.swift
//  human_fighter
//
//  Created by nonamekk on 2022-10-27.
//

import SwiftUI
import Foundation

class Human {
    var hitpoints: Double
    var speed: UInt
    var strenght: Double
    var health: UInt
    
    init(hitpoints: Double, speed: UInt, strength: Double, health: UInt) {
        self.hitpoints = hitpoints
        self.speed = speed
        self.strenght = strength
        self.health = health
    }
    
    func run(force: UInt) -> UInt {
        return force/speed
    }
    
    func rest() {
        if health < 100 {
            hitpoints += 10
            if hitpoints > 100 {
                hitpoints = 100
            }
        }
    }
    
    func melee(human: Human) -> Human {
        if human.strenght < 100 && human.strenght >= self.hitpoints {
            human.strenght -= self.hitpoints
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
        super.init(hitpoints: 0, speed: 20, strength: 10, health: 100)
    }
    
    override func attack(_ human: Human) -> Human {
        // health>
        human.hitpoints -= self.strenght * 3
        
        if human.hitpoints < 0 {
            human.hitpoints = 0
        }
        
        return human
    }
}

class Scout: Human {
    init() {
        super.init(hitpoints: 0, speed: 70, strength: 7, health: 100)
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
        super.init(hitpoints: 100, speed: 35, strength: 3, health: 100)
    }
    
    override func attack(_ human: Human) -> Human {
        return self.melee(human: human)
    }
    
    func heal(_ human: Human) -> Human {
        // hitpoints != health
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
        var dummyTarget = Human(hitpoints: 100, speed: 0, strength: 0, health: 100)
        dummyTarget = self.human.attack(dummyTarget)!
        assert(dummyTarget.hitpoints < 100, "Human attacked dummy target")
    }
    
    func rest() {
        if self.human.health == 100 {
            assertionFailure("Not possible to test rest for human")
        } else {
            let prevHealth = self.human.health
            self.human.rest()
            assert(prevHealth - human.health == 10 || human.health == 100, "Human rested")
        }
        
    }
    
    func run() {
        assert(100 / self.human.run(force: 100) == self.human.speed, "Human runned")
    }
}

Testing(Marine())
Testing(Scout())
Testing(Medic())

