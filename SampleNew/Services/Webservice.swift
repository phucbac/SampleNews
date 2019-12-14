//
//  Webservice.swift
//  SampleNew
//
//  Created by bac pham on 12/13/19.
//  Copyright © 2019 bac pham. All rights reserved.
//

import Foundation
class Webservice {
    
    func getArticles(with url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let articlesList = try JSONDecoder().decode(ArticleList.self, from: data)
                    completion(articlesList.articles)
                }
                catch {
                    print(error)
                }
            }
            
        }.resume()
        
    }
    
}
