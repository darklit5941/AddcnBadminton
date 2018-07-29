//
//  FightTableViewCell.swift
//  AddcnBadminton
//
//  Created by Hua David on 2018/7/29.
//  Copyright © 2018年 darklit. All rights reserved.
//

import UIKit

class FightTableViewCell: UITableViewCell {
    @IBOutlet weak var teamOneLabel: UILabel!
    @IBOutlet weak var teamTwoLabel: UILabel!
    @IBOutlet weak var fightTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
