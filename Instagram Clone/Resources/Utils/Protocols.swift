//
//  Protocols.swift
//  Instagram Clone
//
//  Created by wassim on 4/11/2021.
//

import UIKit


protocol EditProfileProtocol: NSObjectProtocol {
    /// function to show action sheet from tableviewcell
    func showSheet() -> Void
    /// function to fill the parameter updatedModel with the current textfield value
    func didUpdateTextValue(cell: EditProfileCell,updatedModel model: EditProfileModal?) -> Void
}
