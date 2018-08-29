//
//  FightViewController.swift
//  AddcnBadminton
//
//  Created by Hua David on 2018/7/29.
//  Copyright © 2018年 darklit. All rights reserved.
//

import UIKit

class FightViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var dateFormatter = DateFormatter()
    var convertedArray: [Date] = []

    struct dataStruct {
        var teamOneName:String
        var teamTwoName:String
        var createdTime:String
    }
    
    struct momStruct {
        var createdTime:String
        var kids:[dataStruct]
    }
    var datas:[momStruct] = []
    
    var data:[dataStruct] = [
        dataStruct(teamOneName: "王大明&李小美", teamTwoName: "艾昇華&阿土伯", createdTime: "2017-06-01"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2017-06-02"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2017-07-02"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2017-08-02"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2017-09-02"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2017-09-02"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2017-09-02"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2018-06-02"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2017-09-02"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2017-09-02"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2018-06-02"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2018-06-01"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2018-06-01"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2018-06-03"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2018-06-02")
    ]
    
    var sectionsInTable:[String] = []
    
    func getSectionItems(section: Int) -> [dataStruct] {
        var sectionItems = [dataStruct]()
        for item in data {
            if item.createdTime == sectionsInTable[section] {
                sectionItems.append(item)
            }
        }
        return sectionItems
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return datas[section].createdTime
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas[section].kids.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FightTableViewCell
        let dateTextItem = datas[indexPath.section].kids[indexPath.row]

        cell.teamOneLabel.text = dateTextItem.teamOneName
        cell.teamTwoLabel.text = dateTextItem.teamTwoName
        cell.fightTimeLabel.text = ""
        
        return cell
    }

    @IBOutlet weak var FightTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "YYYY-MM-dd"
        self.datas = []
        data.forEach { (obj) in
            if let index = datas.index(where: { (row) -> Bool in
                return row.createdTime == obj.createdTime
            }) {
                datas[index].kids.append(obj)
            } else {
                datas.append(FightViewController.momStruct(createdTime: obj.createdTime, kids: [obj]))
            }
        }
        for (key,value) in datas.enumerated() {
            datas[key].kids = value.kids.sorted(by: { dateFormatter.date(from: $0.createdTime)! < dateFormatter.date(from: $1.createdTime)! })
        }
        datas = datas.sorted(by: { dateFormatter.date(from: $0.createdTime)! > dateFormatter.date(from: $1.createdTime)! })
        
        
        FightTableView.delegate = self
        FightTableView.dataSource = self
        FightTableView.reloadData()
        
        FightTableView.register(UINib(nibName: "FightTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
