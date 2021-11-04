//
//  EditProfileViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var cancelBtn: UIBarButtonItem!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var changePicBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelBtn.title = AppHelper.getLocalizeString(str: "cancel_title")
        saveBtn.title = AppHelper.getLocalizeString(str: "save_title")
        changePicBtn.setTitle(AppHelper.getLocalizeString(str: "change_pic_btn_title"), for: .normal)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changePicAction(_ sender: Any) {
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

    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveAction(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
