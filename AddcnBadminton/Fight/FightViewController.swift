//
//  FightViewController.swift
//  AddcnBadminton
//
//  Created by Hua David on 2018/7/29.
//  Copyright © 2018年 darklit. All rights reserved.
//

import UIKit

class FightViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let dateFormatterPrinter = DateFormatter()
    
    struct dataStruct {
        var teamOneName:String
        var teamTwoName:String
        var createdTime:Date
    }
    
    var data:[dataStruct] = [
        dataStruct(teamOneName: "王大明&李小美", teamTwoName: "艾昇華&阿土伯", createdTime: Date()),
        dataStruct(teamOneName: "阿土伯&李小美", teamTwoName: "王大明&艾昇華", createdTime: Date())
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FightTableViewCell
        dateFormatterPrinter.dateFormat = "yyyy-MM-dd"
        cell.teamOneLabel.text = data[indexPath.row].teamOneName
        cell.teamTwoLabel.text = data[indexPath.row].teamTwoName
        cell.fightTimeLabel.text = dateFormatterPrinter.string(from: data[indexPath.row].createdTime)
        
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
