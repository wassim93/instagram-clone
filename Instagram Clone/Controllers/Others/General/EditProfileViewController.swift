//
//  EditProfileViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

struct EditProfileModal {
    let label: String
    let placeholder: String
    let value: String
}

class EditProfileViewController: UIViewController {

    @IBOutlet weak var cancelBtn: UIBarButtonItem!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var tableview: UITableView!
    private var models = [[EditProfileModal]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelBtn.title = AppHelper.getLocalizeString(str: "cancel_title")
        saveBtn.title = AppHelper.getLocalizeString(str: "save_title")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "EditProfileCell", bundle: nil), forCellReuseIdentifier: "EditProfileCell")
        tableview.register(UINib(nibName: "EditProfileHeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "EditProfileHeaderCell")
        let section = [EditProfileModal(label: "Name", placeholder: "name", value: "")]
        models.append(section)
    }
    
   

    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveAction(_ sender: Any) {

    }
}

extension EditProfileViewController:UITableViewDelegate,UITableViewDataSource,EditProfileProtocol{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileCell", for: indexPath) as! EditProfileCell
        cell.labelTxt.text = models[indexPath.section][indexPath.row].label
        cell.valueTxt.placeholder = models[indexPath.section][indexPath.row].placeholder
        cell.valueTxt.text = models[indexPath.section][indexPath.row].value

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableview.dequeueReusableHeaderFooterView(withIdentifier: "EditProfileHeaderCell") as! EditProfileHeaderCell
        headerView.delegate = self
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 140
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

/// edit profile delegate
    func showSheet() {
        let actionSheet =  UIAlertController(title: AppHelper.getLocalizeString(str: "change_pic_btn_title"), message: AppHelper.getLocalizeString(str: "action_sheet_msg"), preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: AppHelper.getLocalizeString(str: "action_sheet_action1"), style: .default, handler: { _ in

        }))
        actionSheet.addAction(UIAlertAction(title: AppHelper.getLocalizeString(str: "action_sheet_action2"), style: .default, handler: {_ in

        }))
        actionSheet.addAction(UIAlertAction(title: AppHelper.getLocalizeString(str: "action_sheet_action3"), style: .destructive, handler: nil))

        /// this two line for preventing crash on ipad when presenting the sheet
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds

        present(actionSheet, animated: true)
    }


}
