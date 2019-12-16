//
//  ProfileVC.swift
//  NewsApp
//
//  Created by bac pham on 12/12/19.
//  Copyright © 2019 bac pham. All rights reserved.
//

import UIKit
import RealmSwift
class ProfileVC: UIViewController{
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    var userinfo = UserInfo()
    
    var userinfos: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectAllUser()
        
        //show button done
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))

        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: Selector(("doneClicker")))

        var buttons = [UIBarButtonItem]()
        buttons.append(space)
        buttons.append(doneButton)
        toolbar.setItems(buttons, animated: false)
        toolbar.sizeToFit()
        self.txtUserName.inputAccessoryView = toolbar
    }
    @IBAction func doneClicker() {
       self.view.endEditing(true)
    }
    
    @IBAction func ClickSave()
    {
        let user = txtUserName.text!
        if user.isEmpty {
            ShowAler(str_Title: "Error!", str_Message: "input UserName enter!")
        }
        else
        {
            AddUserInfo()
        }
        
    }
    
    func AddUserInfo(){
        let realm = try! Realm()
        try! realm.write {
          //delete all data in realm
          realm.deleteAll()
          //add new username
          let newUser = UserInfo()
         
          newUser.name = txtUserName.text!
          realm.add(newUser)
          userinfo = newUser
          ShowAler(str_Title: "Success", str_Message: "You have successfully saved")
        }
    }
    private func selectAllUser() {
      let realm = try! Realm()
        let infos: Results<UserInfo> = { realm.objects(UserInfo.self) }()
      if(infos.count>0)
      {
        txtUserName.text = infos[0].name
      }
    }
    func ShowAler(str_Title: String, str_Message: String){
        // create the alert
        let alert = UIAlertController(title: str_Title, message: str_Message, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
