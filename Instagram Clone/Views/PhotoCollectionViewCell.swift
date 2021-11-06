//
//  PhotoCollectionViewCell.swift
//  Instagram Clone
//
//  Created by wassim on 6/11/2021.
//

import UIKit
import SDWebImage
class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

        imageView.image = nil
        // Initialization code
    }

     func configure(with model:UserPost) {
        let thumbnailURL = model.thumbnailImage
        imageView.sd_setImage(with: thumbnailURL) { res, error, _, _ in
            //
        }
       
        //
    }

    func configure(debug imageName:String) {
    imageView.image = UIImage(named: imageName)
    }

}
