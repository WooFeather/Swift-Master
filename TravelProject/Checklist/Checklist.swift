//
//  Checklist.swift
//  TravelProject
//
//  Created by 조우현 on 1/5/25.
//

import Foundation

struct Checklist {
    var title: String?
    var bookmark: Bool? = false
    var complete: Bool? = false
}

struct ChecklistItem {
    let checklists: [Checklist] = [
        Checklist(title: "그립톡 구매하기",
                  bookmark: true,
                  complete: true),
        Checklist(title: "사이다 구매",
                  bookmark: false,
                  complete: false)
    ]
}
