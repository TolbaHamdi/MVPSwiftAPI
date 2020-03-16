//
//  UserTodoInteractor.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import Foundation
import Alamofire

class UserTodoInteractor{
    
    func getUserTodos(userId: String, completionHandler: @escaping (Int ,[UserTodos]?) -> ()) {
        let url = "https://jsonplaceholder.typicode.com/todos?userId=\(userId)"
        let Headers = ["Content-Type":"application/json"]
        API.get(url: url, parameters: nil, headers: Headers) { (status, result: [UserTodos]?) in
            if status == 1{
                completionHandler(1,result)
            }else{
                completionHandler(0,nil)
            }
        }
    }
}
