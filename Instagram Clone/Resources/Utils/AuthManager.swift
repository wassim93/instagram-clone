//
//  AuthManager.swift
//  Instagram Clone
//
//  Created by wassim on 31/10/2021.
//

import Firebase


public class AuthManager {
    static let shared = AuthManager()


    // MARK:- Public
    public func registerNewUser(username: String,email: String,password: String){

    }

    public func loginUser(username: String?,email:String?, password: String,completion: @escaping((Bool) -> Void)){
        if let email = email{
            Auth.auth().signIn(withEmail: email, password: password) { authRes, error in
                guard authRes != nil,error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }

        }else if let username = username {

        }

    }

}
