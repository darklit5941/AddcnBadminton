//
//  MemberAddViewController.swift
//  AddcnBadminton
//
//  Created by Hua David on 2018/8/29.
//  Copyright © 2018年 darklit. All rights reserved.
//

import UIKit

class MemberAddViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var genderSegmented: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveMemberData(_ sender: UIBarButtonItem) {
        
        let name: String = nameTextField.text!
        let nickname: String = nicknameTextField.text!
        let gender: String = genderSegmented.titleForSegment(at: genderSegmented.selectedSegmentIndex)!
        
        print("fileURL: \(realm.configuration.fileURL!)")
        let member = RLM_Members()
        member.name = name
        member.nickname = nickname
        member.gender = gender
        
        try! realm.write {
            realm.add(member)
        }
        
        self.navigationController?.popViewController(animated: true)
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
