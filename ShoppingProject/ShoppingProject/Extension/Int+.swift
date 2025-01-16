//
//  Int+.swift
//  ShoppingProject
//
//  Created by 조우현 on 1/15/25.
//

import Foundation

// String?으로 반환값을 주는거면 이걸 사용하는 뷰컨에서 옵셔널 처리를 해줘야 하니까
// 차라리 이 extension 자체에서 옵셔널 처리를 하고 넘겨줘보자
extension Int {
    func numberFormatting() -> String? {
        let nsNumber = NSNumber(value: self)
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: nsNumber)
    }
}
