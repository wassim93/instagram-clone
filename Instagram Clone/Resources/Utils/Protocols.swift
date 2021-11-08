//
//  Protocols.swift
//  Instagram Clone
//
//  Created by wassim on 4/11/2021.
//

import UIKit


protocol EditProfileProtocol: NSObjectProtocol {
    /// function to show action sheet from tableviewcell
    func showSheet() -> Void
    /// function to fill the parameter updatedModel with the current textfield value
    func didUpdateTextValue(cell: EditProfileCell,updatedModel model: EditProfileModal?) -> Void
}
//MARK: - ProfileControllerProtocol

protocol ProfileProtocol:NSObjectProtocol {
    //MARK: - ProfileHeaderInfo
    func didTapEditProfile(header profileHeader:ProfileInfoHeaderCollectionReusableView) -> Void
    func didTapPostView(header profileHeader:ProfileInfoHeaderCollectionReusableView) -> Void
    func didTapFollowersView(header profileHeader:ProfileInfoHeaderCollectionReusableView) -> Void
    func didTapFollowingView(header profileHeader:ProfileInfoHeaderCollectionReusableView) -> Void

    //MARK: - ProfileHeaderTabs

    func didTapGridBtn(header profileHeader:ProfileTabsCollectionReusableView) -> Void
    func didTapTagBtn(header profileHeader:ProfileTabsCollectionReusableView) -> Void

    
}


//MARK: - ListViewController // followers,following
protocol UserFollowProtocol:NSObjectProtocol {
    func didTapFollowUnfollowBtn(model:UserRelationship) -> Void 
}








