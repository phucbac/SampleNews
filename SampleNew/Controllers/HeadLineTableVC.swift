//
//  HeadLineTableVC.swift
//  NewsApp
//
//  Created by bac pham on 13/12/19.
//  Copyright © 2019 bac pham. All rights reserved.
//

import UIKit

class HeadLineTableVC: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLoad()
    }
    private func initLoad() {
        
        Webservice().getArticles(with: URL.urlForTopHeadlines()) { articles in
            
            if let articles = articles {
                
                self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
         return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aCell", for: indexPath) as! HeadLineCell
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.configure(for: articleVM)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HeadLineDetailVC") as! HeadLineDetailVC
        
        vc.detail = articleVM
        self.present(vc, animated: false, completion: nil)
    }
    
}
