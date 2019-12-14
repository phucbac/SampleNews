//
//  HeadLineCell.swift
//  SampleNews
//
//  Created by bac pham on 12/13/19.
//  Copyright © 2019 bac pham. All rights reserved.
//

import UIKit
class HeadLineCell: UITableViewCell {
   
    @IBOutlet weak var imgHeadLine: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    func configure(for vm: ArticleViewModel) {
        self.lblTitle.text = vm.title
        let url = NSURL(string: vm.urlToImage)
        if(url != nil){
            getDataURL(from:(url ?? nil)! as URL ) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url?.lastPathComponent ?? "")
            print("Download Finished")
            DispatchQueue.main.async() {
                self.imgHeadLine.contentMode = .scaleAspectFit
                self.imgHeadLine.image = UIImage(data: data)
            }
            }
        }
        
    }
    func getDataURL(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
