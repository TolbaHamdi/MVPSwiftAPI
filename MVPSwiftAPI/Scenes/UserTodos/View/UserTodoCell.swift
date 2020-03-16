//
//  UserTodoCell.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

class UserTodoCell: UITableViewCell, UserTodoCellView {
    
    @IBOutlet weak var titleTodoLB: UILabel!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        completedSwitch.isEnabled = false
    }
    
    func displayTitle(title: String) {
        titleTodoLB.text = title
    }
    
    func displayCompleted(completed: Bool) {
        completedSwitch.isOn = completed
    }
}
