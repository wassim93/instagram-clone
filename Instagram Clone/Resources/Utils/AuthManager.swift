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
    public func registerNewUser(username: String,email: String,password: String,completion:@escaping (Bool)-> Void){
        /*
         - check if username is available
         - check if email is available
         */
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {

                /*
                 - create account
                 - insert account to db
                 */
                Auth.auth().createUser(withEmail: email, password: password) { authRes, error in
                    guard error == nil,authRes != nil else {
                        // firebase auth couldnt create account
                        completion(false)
                        return
                    }
                    // insert into db
                    DatabaseManager.shared.inserNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }else{
                            // failed to insert into db
                            completion(false)
                            return
                        }
                    }
                }
            }else{
                // username or email doesnt exist
                completion(false)
            }
        }

    }

    public func loginUser(username: String?,email:String?, password: String,completion: @escaping((Bool) -> Void)){
        if let email = email{
            // Email Login
            Auth.auth().signIn(withEmail: email, password: password) { authRes, error in
                guard authRes != nil,error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }

        }else if let username = username {
            print(username)
        }

    }

/// logout firebase user
    public func logOut(completion:(Bool)-> Void){
        do{
            try Auth.auth().signOut()
            completion(true)
            return
        }catch{
            print(error)
            completion(false)
            return
        }
    }

}
