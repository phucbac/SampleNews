//
//  URL+Extensions.swift
//  NewsApp
//
//  Created by bac pham on 12/12/19.
//  Copyright © 2019 bac pham. All rights reserved.
//

import Foundation
import UIKit

extension URL {
    
    static func urlForTopHeadlines() -> URL {
        return URL(string: Constants.URLs.topHeadlines)!
    }
    static func urlForCustom(url: String) ->URL{
        return URL(string: url)!
    }
}
