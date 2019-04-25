//
//  Movie.swift
//  NowPlayingTMDB
//
//  Created by Yuichi Fujiki on 4/24/19.
//  Copyright © 2019 Yfujiki. All rights reserved.
//

import Foundation
import CoreGraphics

class Movie: JSONCodable {
    let voteCount: Int?
    let id: Int
    let video: Bool?
    let voteAverage: Float?
    let title: String?
    let popularity: Float
    let posterPath: String?
    let originalLanguage: String?
    let originalTitle: String?
    let genreIds: Array<Int>?
    let backdropPath: String?
    let adult: Bool?
    let overview: String?
    let releaseDate: String?

    func posterFullPath(for width: Int) -> String? {
        guard let posterPath = posterPath else {
            return nil
        }

        return "https://image.tmdb.org/t/p/w\(width)/\(posterPath)"
    }
}
