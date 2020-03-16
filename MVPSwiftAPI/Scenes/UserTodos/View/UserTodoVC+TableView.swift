//
//  UserTodoVC+TableView.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

extension UserTodoVC: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UserTodoCell", bundle: nil), forCellReuseIdentifier: "UserTodoCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getUserTodosCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTodoCell", for: indexPath) as! UserTodoCell
        presenter?.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
}
