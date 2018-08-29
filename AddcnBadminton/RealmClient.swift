//
//  RealmClient.swift
//  MarryiOS
//
//  Created by 李仲澄 on 2018/6/6.
//  Copyright © 2018 ZhgChgLi. All rights reserved.
//

import Foundation
import RealmSwift

class RealmClient {
    
    static let shared = RealmClient()
    var realm = try? Realm()
    var retry:Bool = false
    
    let schemaVersion: UInt64 = UInt64(APP_VER_NAME.replacingOccurrences(of: ".", with: "")) ?? 1
    // 数据库工具类的版本号
    
    private init() {

    }
    
    func write(callback: @escaping () -> Void) {
        try? self.realm?.write {
            callback()
        }
    }
    
    
    func connect(callback: @escaping () -> Void) {
        let config = Realm.Configuration(schemaVersion: schemaVersion, migrationBlock: { (migration, oldSchemaVersion) in
            /* 什么都不要做！Realm 会自行检测新增和需要移除的属性，然后自动更新硬盘上的数据库架构 */
            if (oldSchemaVersion < self.schemaVersion) {
                print("----数据库升级")
            }
        })
        
        Realm.Configuration.defaultConfiguration = config
        
        Realm.asyncOpen { (realm, error) in
            /* Realm 成功打开，迁移已在后台线程中完成 */
            if let openRealm = realm {
                self.realm = openRealm
                callback()
                print("Realm 資料庫配置成功")
            } else if let error = error { /* 处理打开 Realm 时所发生的错误 */
                print("Realm 数据库配置失败：\(error.localizedDescription)")
                if let path = Realm.Configuration.defaultConfiguration.fileURL {
                    try? FileManager.default.removeItem(at: path)
                    if !self.retry {
                        self.retry = true
                        self.connect(callback: callback)
                    }
                }
            }
        }
    }
    
}
