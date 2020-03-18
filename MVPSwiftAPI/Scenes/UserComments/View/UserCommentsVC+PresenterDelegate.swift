//
//  UserCommentsVC+PresenterDelegate.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/17/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import Foundation

extension UserCommentsVC: UserCommentsView{
    
    func fetchingPostBody(body: String) {
        postTxtLB.text = body
    }
    
    
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

