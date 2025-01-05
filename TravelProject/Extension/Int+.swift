//
//  Int+.swift
//  TravelProject
//
//  Created by 조우현 on 1/5/25.
//

import UIKit

extension Int {
    func numberFormatting() -> String? {
        let nsNumber = NSNumber(value: self)
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: nsNumber)
    }
}
