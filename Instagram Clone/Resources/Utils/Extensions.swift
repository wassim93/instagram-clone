//
//  Extensions.swift
//  Instagram Clone
//
//  Created by wassim on 2/11/2021.
//

import UIKit

extension String{
    func safeDatabaseKey() -> String {
        return self.replacingOccurrences(of: "@", with: "-").self.replacingOccurrences(of: ".", with: "-")
    }
}

/// this extension to  show bottom border of UITextField

extension UITextField{
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.bounds.height, width: UIScreen.main.bounds.width-20, height: 1)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
