//
//  ArticleListViewModel.swift
//  SampleNew
//
//  Created by bac pham on 12/13/19.
//  Copyright © 2019 bac pham. All rights reserved.
//

import Foundation
struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article)
    }
    
}

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description ?? ""
    }
    var urlToImage :String
    {
        return self.article.urlToImage ?? ""
    }
    var url : String
    {
        return self.article.url ?? ""
    }
    var content : String
    {
        return self.article.content ?? ""
    }
}
