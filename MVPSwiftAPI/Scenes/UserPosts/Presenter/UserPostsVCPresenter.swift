//
//  UserPostsVCPresenter.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import Foundation

protocol UserPostsView: class {
    var presenter: UserPostsVCPresenter? { get set }
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    //func navigateToUserDetailsScreen(user: User)
}

protocol UserPostCellView {
    func displayTitle(title: String)
    func displayBody(body: String)
}

class UserPostsVCPresenter {
    
    private weak var view: UserPostsView?
    private let interactor: UserPostsInteractor
    private let router: UserPostsVCRouter
    private var userPosts = [UserPosts]()
    private let user: User
    
    init(view: UserPostsView?, interactor: UserPostsInteractor, router: UserPostsVCRouter, user: User) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.user = user
    }
    
    func viewDidLoad() {
        getUsers()
    }
    
    func getUsers() {
        view?.showIndicator()
        interactor.getUserPosts(userId: "\(user.id!)") { [weak self] status, userPosts in
            guard let self = self else { return } //And note this is only available from swift 4.2
            self.view?.hideIndicator()
            if status == 1 {
                guard let userPosts = userPosts else { return }
                self.userPosts = userPosts
                self.view?.fetchingDataSuccess()
                
            } else {
                self.view?.showError(error: "Error")
            }
        }
    }
    
    func getUserTodosCount() -> Int {
        return userPosts.count
    }
    
    func configure(cell: UserPostCellView, for index: Int) {
        let userPost = userPosts[index]
        cell.displayTitle(title: "\(userPost.title!)")
        cell.displayBody(body: "\(userPost.body!)")
    }
    
    func didSelectRow(index: Int) {
        let post = userPosts[index]
        router.navigateToUserCommentsScreen(from: view, post: post)
    }
    
}
