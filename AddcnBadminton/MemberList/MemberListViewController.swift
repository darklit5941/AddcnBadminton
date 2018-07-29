//
//  MemberListViewController.swift
//  AddcnBadminton
//
//  Created by Hua David on 2018/7/29.
//  Copyright © 2018年 darklit. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    struct dataStruct {
        var name:String
    }
    
    var data:[dataStruct] = [
        dataStruct(name: "王大明"),
        dataStruct(name: "李小美")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MemberListTableViewCell
        
        cell.nameLabel.text = data[indexPath.row].name
        
        return cell
    }

    @IBOutlet weak var MemberListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MemberListTableView.delegate = self
        MemberListTableView.dataSource = self
        MemberListTableView.register(UINib(nibName: "MemberListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
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
