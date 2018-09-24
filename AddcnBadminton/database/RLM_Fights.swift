//
//  Fights.swift
//  AddcnBadminton
//
//  Created by Hua David on 2018/9/19.
//  Copyright © 2018年 darklit. All rights reserved.
//

import UIKit
import RealmSwift

class RLM_Fights : Object {
    
    @objc private(set) dynamic var uuid:String = UUID().uuidString
    @objc dynamic var teamAid:String = ""
    @objc dynamic var teamAname:String = ""
    @objc dynamic var teamAscore:String = ""
    @objc dynamic var teamBid:String = ""
    @objc dynamic var teamBname:String = ""
    @objc dynamic var teamBscore:String = ""
    @objc dynamic var startDate = Date()
    @objc dynamic var endDate = Date()
    
    //設置索引主鍵
    override static func primaryKey() -> String {
        return "uuid"
    }
    
}
