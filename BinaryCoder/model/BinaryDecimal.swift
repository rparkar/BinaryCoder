//
//  BinaryDecimal.swift
//  BinaryCoder
//
//  Created by Rehan Parkar on 2018-02-24.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import Foundation

class BinaryDecimal{
    
    //properties
    var bits: [Int]?
    var integer: Int?
    
    init(_ bits:[Int]) {
        
        self.bits = bits
        
    }
    
    
    init(_ decimal: Int){
        
        self.integer = decimal
        
    }
    
    
    func calculateBinaryValueForInt() -> String {
        var int = integer!
        let rows = [128, 64, 32, 16, 8, 4, 2 , 1]
        var binaryRows: [Int] = []
        for row in rows {
            
            let binaryDigit = oneOrZero(forValue: int, withBitValue: row)
            binaryRows.append(binaryDigit)
            
            if binaryDigit == 1 {
                
                int = int - row
            }
        }
        
        let stringFromIntArray = binaryRows.map { String($0)}
        return stringFromIntArray.joined()
        //print(binaryRows)
    }
    
    
    func calculateIntValueForBinary() -> String {
        
        var value = 0
        var multiplier = 1
        
        guard let bits = bits else {return "somethig went wrong"}
            
            for bit in bits.reversed() {
                
                let newValue = bit * multiplier
                value += newValue
                multiplier *= 2
            }
    
        return String(value)
    
    }
    
    func oneOrZero(forValue value: Int, withBitValue bitValue: Int) -> Int {
        
        if value - bitValue >= 0 {
            
            return 1
            
        }else {
            return 0
        }
    }
    
}
