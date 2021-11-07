//
//  ProfileInfoCollectionReusableView.swift
//  Instagram Clone
//
//  Created by wassim on 6/11/2021.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var followersView: UIView!
    @IBOutlet weak var followingView: UIView!
    @IBOutlet weak var postView: UIView!
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

    weak var delegate:ProfileProtocol?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        followersLBl.text = AppHelper.getLocalizeString(str: "followers_title")
        followingLbl.text = AppHelper.getLocalizeString(str: "following_title")
        postsLbl.text = AppHelper.getLocalizeString(str: "posts_title")
        editBtn.setTitle(AppHelper.getLocalizeString(str: "btn_edit_title"), for: .normal)
        editBtn.layer.cornerRadius = 5
        imageview.image = UIImage(named: "goku_ultra_instinct")
        setupGesture()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageview.layer.cornerRadius =  imageview.frame.height/2
        imageview.clipsToBounds = true
    }

    fileprivate func setupGesture() {
        var gesture = UITapGestureRecognizer(target: self, action: #selector(self.postClickAction(sender:)))
        postView.isUserInteractionEnabled = true
        postView.addGestureRecognizer(gesture)

        gesture = UITapGestureRecognizer(target: self, action: #selector(self.followersClickAction(sender:)))
        followersView.isUserInteractionEnabled = true
        followersView.addGestureRecognizer(gesture)

        gesture = UITapGestureRecognizer(target: self, action: #selector(self.followingClickAction(sender:)))
        followingView.isUserInteractionEnabled = true
        followingView.addGestureRecognizer(gesture)
    }

    
    @IBAction func editAction(_ sender: Any) {
        delegate?.didTapEditProfile(header: self)
    }

    @objc func postClickAction(sender:UITapGestureRecognizer){
        delegate?.didTapPostView(header: self)
    }

    @objc func followersClickAction(sender:UITapGestureRecognizer){
        delegate?.didTapFollowersView(header: self)
    }

    @objc func followingClickAction(sender:UITapGestureRecognizer){
        delegate?.didTapFollowingView(header: self)
    }


}
