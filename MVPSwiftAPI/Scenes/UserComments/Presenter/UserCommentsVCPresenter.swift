//
//  UserCommentsVCPresenter.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/17/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import Foundation

protocol UserCommentsView: class {
    var presenter: UserCommentsVCPresenter? { get set }
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func fetchingPostBody(body: String)
    func showError(error: String)
}

protocol UserCommentCellView {
    func displayName(name: String)
    func displayEmail(email: String)
    func displayBody(body: String)
}

class UserCommentsVCPresenter {
    
    private weak var view: UserCommentsView?
    private let interactor: UserCommentsInteractor
    private let router: UserCommentsVCRouter
    private var userComments = [UserComments]()
    private let post: UserPosts
    
    init(view: UserCommentsView?, interactor: UserCommentsInteractor, router: UserCommentsVCRouter, post: UserPosts) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.post = post
    }
    
    func viewDidLoad() {
        self.view?.fetchingPostBody(body: post.body!)
        getComments()
    }
    
    func getComments() {
        view?.showIndicator()
        interactor.getPostComments(postId: "\(post.id!)") { [weak self] status, userComments in
            guard let self = self else { return } //And note this is only available from swift 4.2
            self.view?.hideIndicator()
            if status == 1 {
                guard let userComments = userComments else { return }
                self.userComments = userComments
                self.view?.fetchingDataSuccess()
                
            } else {
                self.view?.showError(error: "Error")
            }
        }
    }
    
    func getPostCommentsCount() -> Int {
        return userComments.count
    }
    
    func configure(cell: UserCommentCellView, for index: Int) {
        let userComment = userComments[index]
        cell.displayName(name: "\(userComment.name!)")
        cell.displayEmail(email: "\(userComment.email!)")
        cell.displayBody(body: "\(userComment.body!)")
    }
    
    
}
