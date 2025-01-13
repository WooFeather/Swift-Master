//
//  String+.swift
//  AutoLayoutProgrammatically
//
//  Created by 조우현 on 1/14/25.
//

import UIKit

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }
}
