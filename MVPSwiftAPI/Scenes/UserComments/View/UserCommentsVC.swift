//
//  UserCommentsVC.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/17/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

class UserCommentsVC: UIViewController {

    @IBOutlet weak var postTxtLB: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorActivity: UIActivityIndicatorView!
    var presenter: UserCommentsVCPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comments"
        setupTableView()
        presenter?.viewDidLoad()
    }

}
