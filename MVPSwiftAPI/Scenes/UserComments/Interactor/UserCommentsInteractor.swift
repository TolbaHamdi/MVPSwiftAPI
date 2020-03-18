//
//  UserCommentsInteractor.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/17/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import Foundation
import Alamofire

class UserCommentsInteractor{
    
    func getPostComments(postId: String, completionHandler: @escaping (Int ,[UserComments]?) -> ()) {
        let url = "https://jsonplaceholder.typicode.com/comments?postId=\(postId)"
        let Headers = ["Content-Type":"application/json"]
        API.get(url: url, parameters: nil, headers: Headers) { (status, result: [UserComments]?) in
            if status == 1{
                completionHandler(1,result)
            }else{
                completionHandler(0,nil)
            }
        }
    }
}
