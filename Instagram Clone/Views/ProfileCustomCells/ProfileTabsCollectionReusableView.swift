//
//  ProfileTabsCollectionReusableView.swift
//  Instagram Clone
//
//  Created by wassim on 6/11/2021.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {

    weak var delegate:ProfileProtocol?
    @IBOutlet weak var tagBtn: UIButton!
    @IBOutlet weak var gridBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func tagActionBtn(_ sender: Any) {
        tagBtn.tintColor = .systemBlue
        gridBtn.tintColor = .lightGray
        delegate?.didTapTagBtn(header: self)
    }
    @IBAction func gridActionBtn(_ sender: Any) {
        tagBtn.tintColor = .lightGray
        gridBtn.tintColor = .systemBlue
        delegate?.didTapGridBtn(header: self)
    }
}
