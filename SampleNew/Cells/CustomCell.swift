//
//  CustomCell.swift
//  SampleNew
//
//  Created by bac pham on 12/14/19.
//  Copyright © 2019 bac pham. All rights reserved.
//

import Foundation
import UIKit
class CustomCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    
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
                self.img.contentMode = .scaleAspectFit
                self.img.image = UIImage(data: data)
            }
            }
        }
        
    }
    func getDataURL(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
