//
//  NotificationLikeEventCell.swift
//  Instagram Clone
//
//  Created by wassim on 10/11/2021.
//

import UIKit
import Kingfisher

class NotificationLikeEventCell: UITableViewCell {
    
    weak var delegate:NotificationsProtocol?
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    private var model:UserNotification?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.postClickAction(sender:)))
        postImg.isUserInteractionEnabled = true
        postImg.addGestureRecognizer(gesture)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgUser.layer.masksToBounds = true
        imgUser.layer.cornerRadius = imgUser.bounds.height/2
    }
    
    
    
    func configure(with model:UserNotification){
        self.model = model
        usernameLbl.text =  "\(model.user.username) "+model.text

        switch model.type {
            case .like(let post):
                let thumbnail = post.thumbnailImage
                guard !thumbnail.absoluteString.contains("google.com") else{
                    return
                }
                postImg.kf.setImage(with: thumbnail)
                break
            case .follow:
                break
        }

        imgUser.kf.setImage(with: model.user.profilePic)

    }
    
    @objc func postClickAction(sender:UITapGestureRecognizer) {
        guard let model = model else{
            return
        }
        delegate?.didTapRelatedPostBtn(model: model)
    }
    
}
