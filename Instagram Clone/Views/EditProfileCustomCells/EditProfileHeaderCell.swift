//
//  EditProfileHeaderCell.swift
//  Instagram Clone
//
//  Created by wassim on 4/11/2021.
//

import UIKit

class EditProfileHeaderCell: UITableViewHeaderFooterView {

    @IBOutlet weak var changePicBtn: UIButton!
    weak var delegate: EditProfileProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        changePicBtn.setTitle(AppHelper.getLocalizeString(str: "change_pic_btn_title"), for: .normal)
        // Initialization code
    }

  
    @IBAction func changePicAction(_ sender: Any) {
        delegate?.showSheet()
        
    }

}
