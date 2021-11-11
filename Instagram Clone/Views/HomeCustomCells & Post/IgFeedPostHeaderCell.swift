//
//  IgFeedPostHeaderCell.swift
//  Instagram Clone
//
//  Created by wassim on 4/11/2021.
//

import UIKit
import Kingfisher

class IgFeedPostHeaderCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var usernameLbl: UILabel!
    weak var delegate:FeedPostProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = img.frame.height/2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with user:User){
        usernameLbl.text = user.username
        img.image = UIImage(systemName: "person.circle")
        //img.kf.setImage(with: user.profilePic)
    }
    
    @IBAction func moreAction(_ sender: Any) {
        delegate?.didTapMoreBtn()
    }
}
