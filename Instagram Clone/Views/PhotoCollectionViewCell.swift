//
//  PhotoCollectionViewCell.swift
//  Instagram Clone
//
//  Created by wassim on 6/11/2021.
//

import UIKit
import Kingfisher
class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

        imageView.image = nil
        // Initialization code
    }

     func configure(with model:UserPost) {
        let thumbnailURL = model.thumbnailImage
        imageView.kf.setImage(with: thumbnailURL)

       
        //
    }

    func configure(debug imageName:String) {
    imageView.image = UIImage(named: imageName)
    }

}
