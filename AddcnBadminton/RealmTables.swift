//
//  RealmTables.swift
//  MarryiOS
//
//  Created by 李仲澄 on 2018/6/6.
//  Copyright © 2018 ZhgChgLi. All rights reserved.
//

import RealmSwift
class ADLogs: Object {
    @objc dynamic var advert_id = ""
    @objc dynamic var close_day:Int = 0
    @objc dynamic var expiredDate:Date? = nil
    
    override static func primaryKey() -> String? {
        return "advert_id"
    }
}
class LastNotificationMsg: Object {
    @objc dynamic var target_id = ""
    @objc dynamic var last_msg_id:Int = 0
    
    override static func primaryKey() -> String? {
        return "target_id"
    }
}
class unSendMsg: Object {
    @objc dynamic var msg_id = ""
    @objc dynamic var target_id = ""
    @objc dynamic var descri:String = ""
    @objc dynamic var descri_type:String = ""
    @objc dynamic var status:Int = 0
    @objc dynamic var descri_width = 0
    @objc dynamic var descri_height = 0
    override static func primaryKey() -> String? {
        return "msg_id"
    }
}
class TopicReaded: Object {
    @objc dynamic var topic_id = ""
    
    override static func primaryKey() -> String? {
        return "topic_id"
    }
}
