//
//  NotificationLikeEventCell.swift
//  Instagram Clone
//
//  Created by wassim on 10/11/2021.
//

import UIKit

class NotificationLikeEventCell: UITableViewCell {

    weak var delegate:NotificationsProtocol?
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.postClickAction(sender:)))
        postImg.isUserInteractionEnabled = true
        postImg.addGestureRecognizer(gesture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @objc func postClickAction(sender:UITapGestureRecognizer) {
        delegate?.didTapRelatedPostBtn(model: "")
    }
    
}
