//
//  UserPostsCell.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

class UserPostsCell: UITableViewCell, UserPostCellView {
   
    @IBOutlet weak var titleTxtLB: UILabel!
    @IBOutlet weak var bodyTxtLB: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func displayTitle(title: String) {
        titleTxtLB.text = title
       }
       
       func displayBody(body: String) {
        bodyTxtLB.text = body
       }
}
