//
//  UsersInteractor.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/3/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import Foundation
import Alamofire

class UsersInteractor{
    
    func getUsers(completionHandler: @escaping (Int ,[User]?) -> ()) {
        let url = "https://reqres.in/api/users?per_page=12"
        let Headers = ["Content-Type":"application/json"]
        API.get(url: url, parameters: nil, headers: Headers) { (status, result: Users?) in
            if status == 1{
                completionHandler(1,result?.data)
            }else{
                completionHandler(0,nil)
            }
        }
    }
}
