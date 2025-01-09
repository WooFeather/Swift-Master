//
//  UILabel+.swift
//  TravelProject
//
//  Created by 조우현 on 1/3/25.
//

import UIKit

extension UILabel {
    func setChecklistCellLabel(_ text: String) {
        self.text = text
        self.textColor = .black
        self.font = .systemFont(ofSize: 14, weight: .medium)
    }
}
