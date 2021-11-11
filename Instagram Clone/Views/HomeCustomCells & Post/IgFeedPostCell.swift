//
//  IgFeedCell.swift
//  Instagram Clone
//
//  Created by wassim on 4/11/2021.
//

import UIKit
import Kingfisher
import AVFoundation

/// cell for primary content post
class IgFeedPostCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    private var player:AVPlayer?
    private var playerLayer = AVPlayerLayer()
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.addSublayer(playerLayer)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame =  mainView.bounds
    }


    func configure(with post:UserPost){
        img.image = UIImage(named: "narutoo")
        return
        switch post.postType {
            case .photo:
                // show image
                img.kf.setImage(with: post.postURL)
            case .video:
                // load and play video
                player = AVPlayer(url: post.postURL)
                playerLayer.player = player
                playerLayer.player?.volume = 0
                playerLayer.player?.play()

        }

    }
    
}
