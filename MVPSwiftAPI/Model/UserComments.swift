//
//  UserComments.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/17/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import Foundation

class UserComments: Codable{
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
}
