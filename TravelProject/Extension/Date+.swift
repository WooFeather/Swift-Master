//
//  Date+.swift
//  TravelProject
//
//  Created by 조우현 on 1/3/25.
//

import UIKit

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        return dateFormatter.string(from: self)
    }
}
