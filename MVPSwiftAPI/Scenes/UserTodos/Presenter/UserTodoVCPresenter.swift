//
//  UserTodoVCPresenter.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import Foundation

protocol UserTodosView: class {
    var presenter: UserTodoVCPresenter? { get set }
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    //func navigateToUserDetailsScreen(user: User)
}

protocol UserTodoCellView {
    func displayTitle(title: String)
    func displayCompleted(completed: Bool)
}

class UserTodoVCPresenter {
    
    private weak var view: UserTodosView?
    private let interactor: UserTodoInteractor
    private let router: UserTodoVCRouter
    private var userTodos = [UserTodos]()
    private let user: User
    
    init(view: UserTodosView?, interactor: UserTodoInteractor, router: UserTodoVCRouter, user: User) {
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
        interactor.getUserTodos(userId: "\(user.id!)") { [weak self] status, userTodos in
            guard let self = self else { return } //And note this is only available from swift 4.2
            self.view?.hideIndicator()
            if status == 1 {
                guard let userTodos = userTodos else { return }
                self.userTodos = userTodos
                self.view?.fetchingDataSuccess()
                
            } else {
                self.view?.showError(error: "Error")
            }
        }
    }
    
    func getUserTodosCount() -> Int {
        return userTodos.count
    }
    
    func configure(cell: UserTodoCellView, for index: Int) {
        let userTodo = userTodos[index]
        cell.displayTitle(title: "\(userTodo.title!)")
        cell.displayCompleted(completed: userTodo.completed!)
    }
    
    
}
