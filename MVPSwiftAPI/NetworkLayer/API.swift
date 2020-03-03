//
//  API.swift
//  MVPSwiftAPI
//
//  Created by TolBA on 3/3/20.
//  Copyright © 2020 TolBA. All rights reserved.
//

import Foundation
import Alamofire

class API{
    
    class func get<T:Codable>(url: String, parameters: [String:String]?, headers: [String:String]?, completion:@escaping (_ status: Int,_ result: T? ) -> Void){
        
        guard  let url = URL(string: url) else {return}
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            
            guard let data = response.data else {return}
            
            if response.result.isSuccess{
                
                do{
                    
                    let result = try JSONDecoder().decode(T.self, from: data)
                    
                    completion(1,result)
                    
                }catch{
                    print(error.localizedDescription)
                    completion(0,nil)
                }
            }else{
                print(response.result.error!.localizedDescription)
                completion(0,nil)
            }
        }
    }
    
    
    class func post<T:Codable>(url: String, parameters: [String:String]?, headers: [String:String]?, completion:@escaping (_ status: Int,_ result: T? ) -> Void){
        guard  let url = URL(string: url) else {return}
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            guard let data = response.data else {return}
            
            if response.result.isSuccess{
                
                do{
                    
                    let result = try JSONDecoder().decode(T.self, from: data)
                    
                    completion(1,result)
                    
                }catch{
                    print(error.localizedDescription)
                    completion(0,nil)
                }
            }else{
                print(response.result.error!.localizedDescription)
                completion(0,nil)
            }
            
        }
    }
}
