//
//  UsersVC+TableView.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/4/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

extension UsersVC: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getUsersCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.userAvatar.image = #imageLiteral(resourceName: "background").circleMasked
        presenter?.configure(cell: cell, for: indexPath.row)
        
        cell.todosBtn.tag = indexPath.row
        cell.todosBtn.addTarget(self, action: #selector(self.todosBtnTapped(_:)), for: .touchUpInside)
        
        cell.postsBtn.tag = indexPath.row
        cell.postsBtn.addTarget(self, action: #selector(self.postsBtnTapped(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func todosBtnTapped(_ sender: UIButton){
        presenter?.didSelectRow(index: sender.tag, tag: 0)
    }
    
    @objc func postsBtnTapped(_ sender: UIButton){
        presenter?.didSelectRow(index: sender.tag, tag: 1)
    }
}
