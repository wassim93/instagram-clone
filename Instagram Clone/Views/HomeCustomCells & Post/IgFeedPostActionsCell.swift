//
//  IgFeedPostActionsCell.swift
//  Instagram Clone
//
//  Created by wassim on 4/11/2021.
//

import UIKit

class IgFeedPostActionsCell: UITableViewCell {

    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    weak var delegate:FeedPostProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with post: UserPost) {

    }

    @IBAction func likeAction(_ sender: Any) {
        delegate?.didTapLikeBtn()
    }
    @IBAction func commentAction(_ sender: Any) {
        delegate?.didTapCommentBtn()
    }
    @IBAction func sendAction(_ sender: Any) {
        delegate?.didTapSendBtn()
    }

}
