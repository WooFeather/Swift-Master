//
//  BoxOffice.swift
//  NetworkingProject
//
//  Created by 조우현 on 1/14/25.
//

import Foundation

struct BoxOffice: Decodable {
    let boxOfficeResult: BoxOfficeInfo
    
    struct BoxOfficeInfo: Decodable {
        let dailyBoxOfficeList: [Movie]
        
        struct Movie: Decodable {
            let rank: String
            let movieNm: String
            let openDt: String
        }
    }
}
