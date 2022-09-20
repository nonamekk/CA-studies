//
//  main.swift
//  ter
//
//  Created by Admin on 2022-09-20.
//

//import Foundation

var animal: UInt8 = 32
var baam: UInt8 = 0;
var bwt: UInt8 = 0;

for i in 0...animal {
    if ((UInt8.random(in: 0..<animal)) > i) {
        bwt+=1
    } else {baam+=1}
}

print("Black spots", baam)
print("White spots", bwt)
