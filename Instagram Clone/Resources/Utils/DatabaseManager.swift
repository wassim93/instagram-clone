//
//  DatabaseManager.swift
//  Instagram Clone
//
//  Created by wassim on 31/10/2021.
//

import Firebase


public class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database().reference()

   /// check if username and email is available
    ///-Parameters
    /// - email:String representing email
    /// - username :String representing username
    public func canCreateNewUser(with email:String,username:String,completion:(Bool)->Void){
        completion(true)
    }

    /// insert new user into db
     ///-Parameters
     /// - email:String representing email
     /// - username :String representing username
    /// completion: async callback for results if databse entry succeded
    public func inserNewUser(with email:String,username:String,completion:@escaping (Bool)->Void){
        database.child(email.safeDatabaseKey()).setValue(["username":username]){ error ,_ in
            if error == nil {
                // success
                completion(true)
                return
            }else{
                completion(false)
                return
            }
        }

    }


   

}
