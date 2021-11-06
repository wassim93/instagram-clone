//
//  EditProfileCell.swift
//  Instagram Clone
//
//  Created by wassim on 4/11/2021.
//

import UIKit

class EditProfileCell: UITableViewCell {

    @IBOutlet weak var labelTxt: UILabel!
    @IBOutlet weak var valueTxt: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        valueTxt.addBottomBorder()
        // Initialization code
    }



    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
