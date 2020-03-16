//
//  UsersVC.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/4/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

class UsersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter: UsersVCPresenter?
    
    @IBOutlet weak var indicatorActivity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        setupTableView()
        presenter?.viewDidLoad()

    }
}
