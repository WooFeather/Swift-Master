//
//  String+.swift
//  TravelProject
//
//  Created by 조우현 on 1/3/25.
//

import UIKit

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.dateFormat = "yyMMdd"
        return dateFormatter.date(from: self)
    }
}
