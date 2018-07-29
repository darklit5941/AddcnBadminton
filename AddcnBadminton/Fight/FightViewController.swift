//
//  FightViewController.swift
//  AddcnBadminton
//
//  Created by Hua David on 2018/7/29.
//  Copyright © 2018年 darklit. All rights reserved.
//

import UIKit

class FightViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    struct dataStruct {
        var teamOneName:String
        var teamTwoName:String
        var createdTime:String
    }
    
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
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2018-06-02"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2018-06-02"),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: "2018-06-02"),
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
        sectionsInTable = Array(Set(data.map { $0.createdTime }))
        return sectionsInTable[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionsInTable = Array(Set(data.map { $0.createdTime }))
        return sectionsInTable.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getSectionItems(section: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FightTableViewCell
        // get the items in this section
        let sectionItems = self.getSectionItems(section: indexPath.section)
        // get the item for the row in this section
        let dateTextItem = sectionItems[indexPath.row]

        cell.teamOneLabel.text = dateTextItem.teamOneName
        cell.teamTwoLabel.text = dateTextItem.teamTwoName
        cell.fightTimeLabel.text = dateTextItem.createdTime
        
        return cell
    }

    @IBOutlet weak var FightTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FightTableView.delegate = self
        FightTableView.dataSource = self
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
