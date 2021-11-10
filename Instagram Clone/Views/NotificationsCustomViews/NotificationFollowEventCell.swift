//
//  NotificationFollowEventCell.swift
//  Instagram Clone
//
//  Created by wassim on 10/11/2021.
//

import UIKit
import Kingfisher

class NotificationFollowEventCell: UITableViewCell {

    weak var delegate:NotificationsProtocol?
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var followBtn: UIButton!
    private var model:UserNotification?

    override func awakeFromNib() {
        super.awakeFromNib()
        followBtn.layer.cornerRadius = 5

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        img.layer.masksToBounds = true
        img.layer.cornerRadius = img.bounds.height/2
    }

    func configure(with model:UserNotification){
        self.model = model
        usernameLbl.text =  "\(model.user.username) "+model.text
        guard !model.user.profilePic.absoluteString.contains("google.com") else{
            return
        }
        img.kf.setImage(with: model.user.profilePic)
        switch model.type {
            case .like(_):
                break
            case .follow:
                break
        }

    }
    
    @IBAction func followUnfollowAction(_ sender: Any) {
        delegate?.didTapFollowUnfollowBtn(model: "")
    }
}
