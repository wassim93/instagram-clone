//
//  Models.swift
//  Instagram Clone
//
//  Created by wassim on 6/11/2021.
//

import Foundation

enum Gender{
    case male,female,other
}

struct User {
    let bio:String
    let username:String
    let name:(first:String,last:String)
    let profilePic:URL
    let birthDate:Date
    let gender:Gender
    let counts:UserCount
    let joinDate:Date

}

struct UserCount {
    let followers:Int
    let following:Int
    let posts:Int
}


enum UserPostType:String {
    case photo = "Photo"
    case video = "Video"
}
/// the post representation
 public struct UserPost {
    let identifier:String
    let postType:UserPostType
    let thumbnailImage:URL
    let postURL:URL // video url or photo
    let caption:String?
    let likeCount:[PostLikes]
    let comments:[PostComment]
    let createdDate:Date
    let taggedUsers:[User]
    let owner:User
}

struct PostLikes {
    let username:String
    let postIdentifier:String

}

struct CommentLikes {
    let username:String
    let commentIdentifier:String

}

struct PostComment {
    let identifier:String
    let username:String
    let text:String
    let createdDate:Date
    let likes:[CommentLikes]
}
