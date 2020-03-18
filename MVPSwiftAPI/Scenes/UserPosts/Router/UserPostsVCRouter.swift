//
//  UserPostsVCRouter.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

class UserPostsVCRouter{
    
    class func createUserPostsVC(user: User) -> UIViewController {
            let userPostsVC = UserPostsVC.init() as UserPostsVC
            let interactor = UserPostsInteractor()
            let router = UserPostsVCRouter()
            let presenter = UserPostsVCPresenter(view: userPostsVC, interactor: interactor, router: router, user: user)
            userPostsVC.presenter = presenter
            return userPostsVC
        }
    
    func navigateToUserCommentsScreen(from view: UserPostsView?, post: UserPosts) {
        let usercommentsView = UserCommentsVCRouter.createUserCommentsVC(post: post)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(usercommentsView, animated: true)
        }
    }
    }
