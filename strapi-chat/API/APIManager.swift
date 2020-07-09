//
//  APIManager.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 09/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import Foundation
import Alamofire

class APIManager{
    static let instance = APIManager()
    
    func register(register: RegistrationModel) {
        let headers: HTTPHeaders = [.contentType("application/json")]
        AF.request("\(register_url)", method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                }catch{
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
