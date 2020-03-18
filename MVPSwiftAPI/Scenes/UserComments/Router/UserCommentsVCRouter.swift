//
//  UserCommentsVCRouter.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/17/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

class UserCommentsVCRouter{
    
    class func createUserCommentsVC(post: UserPosts) -> UIViewController {
            let userCommentsVC = UserCommentsVC.init() as UserCommentsVC
            let interactor = UserCommentsInteractor()
            let router = UserCommentsVCRouter()
            let presenter = UserCommentsVCPresenter(view: userCommentsVC, interactor: interactor, router: router, post: post)
            userCommentsVC.presenter = presenter
            return userCommentsVC
        }
    }
