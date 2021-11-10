//
//  NoNotificationView.swift
//  Instagram Clone
//
//  Created by wassim on 10/11/2021.
//

import UIKit

class NoNotificationView: UIView {

    private let label: UILabel = {
        let label = UILabel()
        label.text = AppHelper.getLocalizeString(str: "no_notification_msg")
        label.textColor =  .secondaryLabel
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()

    private let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .secondaryLabel
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "bell")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: (self.frame.width - 50)/2, y: 0, width: 50, height: 50).integral
        label.frame = CGRect(x: 0, y: imageView.bounds.height+5, width: self.frame.width, height: self.frame.height-50).integral
    }

}
