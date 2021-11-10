//
//  NotificationFollowEventCell.swift
//  Instagram Clone
//
//  Created by wassim on 10/11/2021.
//

import UIKit

class NotificationFollowEventCell: UITableViewCell {

    weak var delegate:NotificationsProtocol?
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var followBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with model:String){
        
    }
    
    @IBAction func followUnfollowAction(_ sender: Any) {
        delegate?.didTapFollowUnfollowBtn(model: "")
    }
}
