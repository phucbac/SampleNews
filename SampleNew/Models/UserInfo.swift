//
//  UserInfo.swift
//  SampleNew
//
//  Created by bac pham on 12/16/19.
//  Copyright © 2019 bac pham. All rights reserved.
//

import Foundation
import RealmSwift

class UserInfo: Object {
  @objc dynamic var name = ""
  @objc dynamic var created = Date()
}
