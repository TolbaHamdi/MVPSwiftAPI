//
//  UserCell.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/4/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit
import Kingfisher

class UserCell: UITableViewCell, UserCellView {
    
    

    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userNameLB: UILabel!
    @IBOutlet weak var emailLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        userAvatar.layer.cornerRadius = userAvatar.frame.width / 2
        //userAvatar.layer.masksToBounds = false
        
    }
    
    func displayName(name: String) {
        userNameLB.text = name
    }
    
    func displayEmail(email: String) {
        emailLB.text = email
    }
    
    func displayImage(url: String) {
        guard let url = URL(string: url)else {fatalError("URL Error")}
        userAvatar.kf.setImage(with: url, placeholder: UIImage(named: "name"))
    }
    
    }
