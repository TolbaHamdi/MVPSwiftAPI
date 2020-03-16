//
//  UsersVCRouter.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

class UsersVCRouter{
    
    class func createUsersVC() -> UIViewController {
        let usersVC = UsersVC.init() as UsersVC
        let root = BaseNC(rootViewController: usersVC)
        
        let interactor = UsersInteractor()
        let router = UsersVCRouter()
        let presenter = UsersVCPresenter(view: usersVC, interactor: interactor, router: router)
        usersVC.presenter = presenter
        return root
    }
}