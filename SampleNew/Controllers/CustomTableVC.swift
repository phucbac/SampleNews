//
//  CustomTableVC.swift
//  NewsApp
//
//  Created by bac pham on 12/12/19.
//  Copyright © 2019 bac pham. All rights reserved.
//

import UIKit
class CustomTableVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource  {
    private var customListVM: ArticleListViewModel!
    
    @IBOutlet weak var tblViewCustom: UITableView!
    var querySearch: String = "bitcoin"
    @IBOutlet weak var pickerViewEverything: UIPickerView!
    var pickerEverythingData: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerViewEverything.delegate = self
        self.pickerViewEverything.dataSource = self
        pickerEverythingData = Constants.strArray.EverthingArray
        self.tblViewCustom.delegate = self
        self.tblViewCustom.dataSource = self
        initLoad()
    }
    private func initLoad() {
        let url: String = Constants.URLs.customSource + querySearch + "&apiKey=" + Constants.URLs.apiKey
        Webservice().getArticles(with: URL.urlForCustom(url: url)) { articles in
            
            if let articles = articles {
                
                self.customListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tblViewCustom.reloadData()
                }
            }
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerEverythingData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerEverythingData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        querySearch = pickerEverythingData[row];
        initLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return self.customListVM == nil ? 0 : self.customListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.customListVM.numberOfRowsInSection(section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aCell", for: indexPath) as! CustomCell
        
        let articleVM = self.customListVM.articleAtIndex(indexPath.row)
        cell.configure(for: articleVM)
        return cell
    }
}
