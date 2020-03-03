//
//  Users.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/3/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import Foundation

class Users: Codable {
    let page: Int?
    let per_page: Int?
    let total: Int?
    let total_pages: Int?
    let data: [User]
}

class User: Codable {
    let id: Int?
    let email: String?
    let first_name: String?
    let last_name: String?
    let avatar: String?
}
