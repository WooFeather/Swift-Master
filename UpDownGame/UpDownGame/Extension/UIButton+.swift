//
//  UIButton+.swift
//  UpDownGame
//
//  Created by 조우현 on 1/10/25.
//

import UIKit

extension UIButton {
    func buttonEnable() {
        self.isEnabled = true
        self.backgroundColor = .black
    }
    
    func buttonDisable() {
        self.isEnabled = false
        self.backgroundColor = .gray
    }
}
