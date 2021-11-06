//
//  ProfileInfoCollectionReusableView.swift
//  Instagram Clone
//
//  Created by wassim on 6/11/2021.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var followersNbLbl: UILabel!
    @IBOutlet weak var followersLBl: UILabel!
    @IBOutlet weak var followingNbLbl: UILabel!
    @IBOutlet weak var followingLbl: UILabel!
    @IBOutlet weak var postsLbl: UILabel!
    @IBOutlet weak var postNbLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
