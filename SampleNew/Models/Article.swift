//
//  Article.swift
//  SampleNew
//
//  Created by bac pham on 12/13/19.
//  Copyright © 2019 bac pham. All rights reserved.
//

import Foundation
struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
    let urlToImage: String?
    let url: String?
    let content: String?
}
