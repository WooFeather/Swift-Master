//
//  MovieData.swift
//  AutoLayoutProgrammatically
//
//  Created by 조우현 on 1/14/25.
//

import Foundation

struct Movie {
    let ranking: Int
    let title: String
    let releaseDate: String
}

struct MovieData {
    let movieList: [Movie] = [
        Movie(
            ranking: 1,
            title: "엽문4: 더 파이널",
            releaseDate: "2020-04-01"
        ),
        Movie(
            ranking: 2,
            title: "주디",
            releaseDate: "2020-03-25"
        ),
        Movie(
            ranking: 3,
            title: "1917",
            releaseDate: "2020-02-19"
        ),
        Movie(
            ranking: 4,
            title: "인비저블맨",
            releaseDate: "2020-02-26"
        ),
        Movie(
            ranking: 5,
            title: "n번째 이별 중",
            releaseDate: "2020-04-01"
        ),
        Movie(
            ranking: 6,
            title: "스케어리 스토리: 어둠의 속삭임",
            releaseDate: "2020-03-25"
        ),
        Movie(
            ranking: 7,
            title: "날씨의 아이",
            releaseDate: "2019-10-30"
        ),
        Movie(
            ranking: 8,
            title: "라라랜드",
            releaseDate: "2016-12-07"
        ),
        Movie(
            ranking: 9,
            title: "너의 이름은.",
            releaseDate: "2017-01-04"
        ),
        Movie(
            ranking: 10,
            title: "다크 워터스",
            releaseDate: "2020-03-11"
        )
    ]
}
