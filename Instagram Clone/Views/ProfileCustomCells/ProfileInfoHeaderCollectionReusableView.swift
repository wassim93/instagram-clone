//
//  ProfileInfoCollectionReusableView.swift
//  Instagram Clone
//
//  Created by wassim on 6/11/2021.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var bioLbl: UILabel!
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
        followersLBl.text = AppHelper.getLocalizeString(str: "followers_title")
        followingLbl.text = AppHelper.getLocalizeString(str: "following_title")
        postsLbl.text = AppHelper.getLocalizeString(str: "posts_title")
        editBtn.setTitle(AppHelper.getLocalizeString(str: "btn_edit_title"), for: .normal)
        editBtn.layer.cornerRadius = 5


        imageview.image = UIImage(named: "goku_ultra_instinct")

        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageview.layer.cornerRadius =  imageview.frame.height/2
        imageview.clipsToBounds = true

    }

    
}
