//
//  BaseNC.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/4/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import UIKit

class BaseNC: UINavigationController {

    let navBarApperance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationBar.tintColor = UIColor.gray
        //self.navigationBar.prefersLargeTitles = true
       
    }
    


}

