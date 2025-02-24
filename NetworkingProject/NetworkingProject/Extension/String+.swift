//
//  String+.swift
//  NetworkingProject
//
//  Created by 조우현 on 1/14/25.
//

import UIKit

extension String {
    // extension을 활용해 빼봤습니당
    func resultLabelTextAttribute() -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(.foregroundColor, value: UIColor.black, range: (self as NSString).range(of: "당첨결과"))
        attributeString.addAttribute(.font, value: UIFont.systemFont(ofSize: 25, weight: .regular), range: (self as NSString).range(of: "당첨결과"))
        
        return attributeString
    }
}
