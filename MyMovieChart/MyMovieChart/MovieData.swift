//
//  MovieData.swift
//  MyMovieChart
//
//  Created by yeoboya_211221_03 on 2022/01/07.
//

import Foundation

// MARK: - Welcome
struct MovieData: Codable {
    let hoppin: Hoppin!
}

// MARK: - Hoppin
struct Hoppin: Codable {
    let totalCount: String
    let movies: Movies!
}

// MARK: - Movies
struct Movies: Codable {
    let movie: [Movie?]
}

// MARK: - Movie
struct Movie: Codable {
    let genreNames, genreIDS, title, movieID: String!
    let linkURL: String!
    let participant, ratingAverage: String!
    let thumbnailImage: String!

    enum CodingKeys: String, CodingKey {
        case genreNames
        case genreIDS = "genreIds"
        case title
        case movieID = "movieId"
        case linkURL = "linkUrl"
        case participant, ratingAverage, thumbnailImage
    }
}
