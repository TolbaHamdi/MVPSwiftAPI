//
//  UserCommentsVC+TableView.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/17/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

extension UserCommentsVC: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UserCommentCell", bundle: nil), forCellReuseIdentifier: "UserCommentCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getPostCommentsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCommentCell", for: indexPath) as! UserCommentCell
        presenter?.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
}
