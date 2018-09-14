//
//  MemberListViewController.swift
//  AddcnBadminton
//
//  Created by Hua David on 2018/7/29.
//  Copyright © 2018年 darklit. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let dateFormatterPrinter = DateFormatter()

    let memberResult = realm.objects(RLM_Members.self)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MemberListTableViewCell
        dateFormatterPrinter.dateFormat = "yyyy-MM-dd"
        cell.nameLabel.text = memberResult[indexPath.row].nickname
        cell.createdTimeLabel.text = dateFormatterPrinter.string(from: memberResult[indexPath.row].createDate)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MemberListTableView.reloadData()
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
