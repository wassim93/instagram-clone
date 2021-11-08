//
//  ListCell.swift
//  Instagram Clone
//
//  Created by wassim on 8/11/2021.
//

import UIKit

enum FollowState{
    case following,not_following
}

struct UserRelationship {
    let username:String
    let name:String
    let type:FollowState
}

class UserFollowCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var labelTxt: UILabel!
    weak var delegate:UserFollowProtocol?
    private var model:UserRelationship?
    override func awakeFromNib() {
        super.awakeFromNib()
        followBtn.layer.cornerRadius = 5
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        img.layer.masksToBounds = true
        img.layer.cornerRadius = img.bounds.height/2
    }

    @IBAction func btnFollowAction(_ sender: Any) {
        guard let model = model else {
            return
        }
        delegate?.didTapFollowUnfollowBtn(model: model)
    }

    func configure(with model:UserRelationship)  {
        self.model = model
        nameLbl.text = model.name
        usernameLbl.text = model.username
        switch model.type {
            case .following:
                followBtn.setTitle(AppHelper.getLocalizeString(str: "unfollow_title"), for: .normal)
                followBtn.backgroundColor = .systemGray
            case .not_following:
                followBtn.setTitle(AppHelper.getLocalizeString(str: "follow_title"), for: .normal)
                followBtn.backgroundColor = .systemBlue
        }
    }
    
}
