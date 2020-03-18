//
//  UserPostsVC+PresenterDelegate.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import Foundation

extension UserPostsVC: UserPostsView{
    
    func showIndicator() {
            indicatorActivity.startAnimating()
       }
       
       func hideIndicator() {
           indicatorActivity.stopAnimating()
       }
       
       func fetchingDataSuccess() {
           tableView.reloadData()
       }
       
       func showError(error: String) {
           print(error)
       }
}
