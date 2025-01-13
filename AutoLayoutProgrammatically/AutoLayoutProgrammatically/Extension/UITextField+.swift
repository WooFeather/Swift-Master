//
//  UITextField+.swift
//  AutoLayoutProgrammatically
//
//  Created by 조우현 on 1/14/25.
//

// 우석님이 주신 플레이스홀더 색상 변경 extension ㅎㅎ
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
