//
//  UITextField+.swift
//  NetworkingProject
//
//  Created by 조우현 on 1/14/25.
//

import UIKit

extension UITextField {
    func setColor(_ placeholderColor: UIColor){
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues{ $0 }
        )
    }
}
