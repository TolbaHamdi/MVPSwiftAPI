//
//  UserTodoVCRouter.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

class UserTodoVCRouter{
    
    class func createUserTodoVC(user: User) -> UIViewController {
        let usersTodoVC = UserTodoVC.init() as UserTodoVC
        let interactor = UserTodoInteractor()
        let router = UserTodoVCRouter()
        let presenter = UserTodoVCPresenter(view: usersTodoVC, interactor: interactor, router: router, user: user)
        usersTodoVC.presenter = presenter
        return usersTodoVC
    }
}
