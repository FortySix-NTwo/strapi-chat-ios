//
//  AuthenticationAPI.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 11/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import Foundation
import Alamofire
import SwiftJWT

class AuthenticationAPI: APIManager {
  
  static let instance = AuthenticationAPI()
  
  func register(register: RegisterModel, completionHandler: @escaping (Bool) -> ()){
    let headers: HTTPHeaders = [.contentType("application/json")]
    AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response { response in
      switch response.result {
      case .success(let data):
        do {
          let json = try
            JSONSerialization.jsonObject(with: data!, options: [])
          if response.response?.statusCode == 200 {
            let jwt = JWT(claims: MyClaims(jwt: "jwt"))
            let privateKey = jwt_token.data(using: .utf8)!
            let rsaJWTEncoder = JWTEncoder(jwtSigner: JWTSigner.rs256(privateKey: privateKey))
            do {
              let jwtString = try rsaJWTEncoder.encodeToString(jwt)
              debugPrint(jwtString)
            } catch {
              debugPrint("Failed to encode JWT: \(error)")
            }
            debugPrint(json)
            completionHandler(true)
          } else {
            completionHandler(false)
          }
        } catch {
          print(error.localizedDescription)
          completionHandler(false)
        }
      case .failure(let error):
        print(error.localizedDescription)
        completionHandler(false)
      }
    }
  }
  
  func login(login: LoginModel, completionHandler: @escaping (Bool) -> ()) {
    let headers: HTTPHeaders = [.contentType("application/json"), .authorization(bearerToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNTk0NTA1MTcyLCJleHAiOjE1OTcwOTcxNzJ9.ZIqozztx4H2Wf2pzWtujQ02sNvcLM3vMut-H7UJm90Q")]
    AF.request(login_url, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response { response in
      switch response.result {
      case .success(let data):
        do {
          let json = try JSONSerialization.jsonObject(with: data!, options: [])
          if response.response?.statusCode == 200 {
            debugPrint(json)
            completionHandler(true)
          } else if response.response?.statusCode == 401 {
            completionHandler(false)
          } else {
            debugPrint("Internal Error")
            completionHandler(false)
          }
        } catch {
          print(error.localizedDescription)
          completionHandler(false)
        }
      case .failure(let error):
        print(error.localizedDescription)
        completionHandler(false)
      }
    }
  }
}
