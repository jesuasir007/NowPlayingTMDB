//
//  Constants.swift
//  NowPlayingTMDB
//
//  Created by Yuichi Fujiki on 4/25/19.
//  Copyright © 2019 Yfujiki. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

struct Constants {
    static func MOVIE_CELL_SIZE() -> CGSize {

        let width = PORTRAIT_SCREEN_WIDTH() / 3 - 20

        // Aspect ratio of poster image is 1:0.675
        // https://help.imdb.com/article/contribution/images-videos/imdb-image-faqs/G64MGN2G43F42PES#
        return CGSize(width: width, height: width / 0.675)
    }

    static func POSTER_IMAGE_WIDTH_FOR_SIZE(size: CGSize) -> Int {
        let exactHeight = size.height * UIScreen.main.scale * MOVIE_CELL_SIZE().height
        let exactWidth = exactHeight * 0.675

        // From my experimentation it seems it only supports 200/300/400/500 width
        // Don't see any other documentation https://developers.themoviedb.org/3/getting-started/images
        var width: Int = 0
        switch exactWidth {
        case 0...200:
            width = 200
        case 201...300:
            width = 300
        case 301...400:
            width = 400
        default:
            width = 500
        }

        return width
    }

    static func PORTRAIT_SCREEN_WIDTH() -> CGFloat {
        return min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    }

    static func PARSE_YEAR_FROM_YYYYMMDD(yyyymmdd: String?) -> String {
        guard let yyyy = yyyymmdd?.split(separator: "-").first else {
            return ""
        }

        return String(yyyy)
    }
}
