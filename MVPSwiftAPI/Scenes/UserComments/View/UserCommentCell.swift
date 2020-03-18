//
//  UserCommentCell.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/17/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

class UserCommentCell: UITableViewCell, UserCommentCellView {
    
    @IBOutlet weak var nameTxtLB: UILabel!
    @IBOutlet weak var emailTxtLB: UILabel!
    @IBOutlet weak var commentTxtLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         selectionStyle = .none
    }

    func displayName(name: String) {
        nameTxtLB.text = name
    }
    
    func displayEmail(email: String) {
        emailTxtLB.text = email
    }
    
    func displayBody(body: String) {
        commentTxtLB.text = body
    }
    
}
