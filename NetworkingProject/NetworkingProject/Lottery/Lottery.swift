//
//  Lottery.swift
//  NetworkingProject
//
//  Created by 조우현 on 1/14/25.
//

import Foundation

struct Lottery: Decodable {
    let drwNoDate: String
    let drwNo: Int
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}

struct LotteryDummy {
    let dummy = Lottery(
        drwNoDate: "2020-05-30",
        drwNo: 913,
        drwtNo1: 6,
        drwtNo2: 14,
        drwtNo3: 16,
        drwtNo4: 21,
        drwtNo5: 27,
        drwtNo6: 37,
        bnusNo: 40
    )
}
