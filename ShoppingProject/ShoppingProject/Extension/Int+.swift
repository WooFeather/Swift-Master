//
//  Int+.swift
//  ShoppingProject
//
//  Created by 조우현 on 1/15/25.
//

import Foundation

extension Int {
    func numberFormatting() -> String? {
        let nsNumber = NSNumber(value: self)
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: nsNumber)
    }
}
