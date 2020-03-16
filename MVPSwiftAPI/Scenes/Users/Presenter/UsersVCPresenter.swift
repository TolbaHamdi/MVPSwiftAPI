//
//  UsersVCPresenter.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/4/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher


protocol UsersView: class {
    var presenter: UsersVCPresenter? { get set }
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    //func navigateToUserDetailsScreen(user: User)
}

protocol UserCellView {
    func displayName(name: String)
    func displayEmail(email: String)
    func displayImage(url: String)
}

class UsersVCPresenter {
    
    private weak var view: UsersView?
    private let interactor: UsersInteractor
    private let router: UsersVCRouter
    private var users = [User]()
    
    init(view: UsersView?, interactor: UsersInteractor, router: UsersVCRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        getUsers()
    }
    
    func getUsers() {
        view?.showIndicator()
        interactor.getUsers { [weak self] status, users in
            guard let self = self else { return } //And note this is only available from swift 4.2
            self.view?.hideIndicator()
            if status == 1 {
                guard let users = users else { return }
                self.users = users
                self.view?.fetchingDataSuccess()
                
            } else {
                self.view?.showError(error: "Error")
            }
        }
    }
    
    func getUsersCount() -> Int {
        return users.count
    }
    
    func configure(cell: UserCellView, for index: Int) {
        let user = users[index]
        cell.displayName(name: "\(user.first_name!) \(user.last_name!)")
        cell.displayEmail(email: user.email!)
        cell.displayImage(url: user.avatar!)
    }
    
    
}

