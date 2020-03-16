//
//  UserTodoVC.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

class UserTodoVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorActivity: UIActivityIndicatorView!
     var presenter: UserTodoVCPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todos"
        setupTableView()
        presenter?.viewDidLoad()

    }
}
