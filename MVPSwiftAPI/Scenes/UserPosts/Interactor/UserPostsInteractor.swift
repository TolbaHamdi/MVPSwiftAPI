//
//  UserPostsInteractor.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/16/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import Foundation
import Alamofire

class UserPostsInteractor{
    
    func getUserPosts(userId: String, completionHandler: @escaping (Int ,[UserPosts]?) -> ()) {
        let url = "https://jsonplaceholder.typicode.com/posts?userId=\(userId)"
        let Headers = ["Content-Type":"application/json"]
        API.get(url: url, parameters: nil, headers: Headers) { (status, result: [UserPosts]?) in
            if status == 1{
                completionHandler(1,result)
            }else{
                completionHandler(0,nil)
            }
        }
    }
}
