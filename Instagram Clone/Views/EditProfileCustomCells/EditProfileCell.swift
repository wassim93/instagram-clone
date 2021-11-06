//
//  EditProfileCell.swift
//  Instagram Clone
//
//  Created by wassim on 4/11/2021.
//

import UIKit

class EditProfileCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var labelTxt: UILabel!
    @IBOutlet weak var valueTxt: UITextField!
    private var model:EditProfileModal?
    weak var delegate:EditProfileProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        valueTxt.delegate = self
        valueTxt.addBottomBorder()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureModel(model:EditProfileModal){
        self.model = model
        labelTxt.text =  model.label
        valueTxt.placeholder = model.placeholder
        valueTxt.text = model.value
    }


    // MARK: - Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        model?.value = textField.text
        guard let model = model else{
            return true
        }
        delegate?.didUpdateTextValue(cell: self, updatedModel: model)
        valueTxt.resignFirstResponder()
        return true
    }
    
}
