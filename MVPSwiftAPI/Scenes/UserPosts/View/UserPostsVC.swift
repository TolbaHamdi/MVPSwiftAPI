//
//  UserPostsVC.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

class UserPostsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorActivity: UIActivityIndicatorView!
    var presenter: UserPostsVCPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        setupTableView()
        presenter?.viewDidLoad()
    }

}
