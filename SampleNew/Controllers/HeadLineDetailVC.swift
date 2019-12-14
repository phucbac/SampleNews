//
//  HeadLineDetailTableVC.swift
//  SampleNew
//
//  Created by bac pham on 12/13/19.
//  Copyright © 2019 bac pham. All rights reserved.
//

import Foundation
import UIKit
class HeadLineDetailVC: UIViewController {
    @IBOutlet var imgDetail: UIImageView!
    @IBOutlet var lblDetail: UILabel!
    @IBOutlet var lblContent: UILabel!
    @IBOutlet var lblDesciption: UILabel!
    var detail : ArticleViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblDetail.text = detail?.title
        let url = NSURL(string: detail?.urlToImage ?? "")
        if(url != nil){
            getDataURL(from:(url ?? nil)! as URL ) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url?.lastPathComponent ?? "")
            print("Download Finished")
            DispatchQueue.main.async() {
                self.imgDetail.contentMode = .scaleAspectFit
                self.imgDetail.image = UIImage(data: data)
            }
            }
        }
        
        self.lblContent.text = detail?.content
        self.lblContent.sizeToFit()
    }
    func getDataURL(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
