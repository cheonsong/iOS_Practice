//
//  TestMovieVO.swift
//  MyMovieChart
//
//  Created by yeoboya_211221_03 on 2022/01/06.
//

import Foundation

struct TestMovieVO: Codable {
    var hoppin: Hoppin
}

struct Hoppin: Codable {
    var movies: Movies
    var totalCount: Int
}

struct Movies: Codable {
    var movie: [Movie]
}

struct Movie: Codable {
    var title: String
}

