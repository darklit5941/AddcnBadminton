//
//  members.swift
//  AddcnBadminton
//
//  Created by Hua David on 2018/8/29.
//  Copyright © 2018年 darklit. All rights reserved.
//

import UIKit
import RealmSwift

class RLM_Members : Object {
    
    @objc private(set) dynamic var uuid:String = UUID().uuidString
    @objc dynamic var name:String = ""
    @objc dynamic var nickname:String = ""
    @objc dynamic var gender:String = ""
    @objc dynamic var createDate = Date()
    
    //設置索引主鍵
    override static func primaryKey() -> String {
        return "uuid"
    }
    
}
