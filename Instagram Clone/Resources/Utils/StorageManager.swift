//
//  StorageManager.swift
//  Instagram Clone
//
//  Created by wassim on 31/10/2021.
//

import FirebaseStorage

public class StorageManager {
    static let shared = StorageManager()

    private let bucket = Storage.storage().reference()
    public enum IGStorageManagerError : Error {
        case failedTodownload
    }


    // MARK:- Public

    public func uploadUserPost(model:UserPost,completion: @escaping (Result<URL,Error>)->Void){

    }

    public func downloadImage(with reference:String,completion: @escaping (Result<URL,IGStorageManagerError>)->Void) {
        bucket.child(reference).downloadURL { url, error in
            guard let url = url,error == nil else{
                completion(.failure(.failedTodownload))
                return
            }
            completion(.success(url))
        }
    }
    
}


