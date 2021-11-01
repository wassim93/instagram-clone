//
//  LoginViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit
import DropDown

class LoginViewController: UIViewController {

    @IBOutlet weak var selectedLanguageLbl: UILabel!
    @IBOutlet weak var languagesDropDown: UIView!

    @IBOutlet weak var newAccountLbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    var selectedLanguage:String = UserDefaults.standard.string(forKey: "Language")!
    let dropDown = DropDown()

    struct Constants {
        static let languages = [AppHelper.getLocalizeString(str: "en_language"), AppHelper.getLocalizeString(str: "fr_language")]
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        dropdownConfig()
        uiConfig()
    }

    fileprivate func uiConfig() {
        emailTxt.placeholder = AppHelper.getLocalizeString(str: "email_input_placeholder")
        passwordTxt.placeholder = AppHelper.getLocalizeString(str: "pass_input_placeholder")
        loginBtn.setTitle(AppHelper.getLocalizeString(str: "login_btn_text"), for: .normal)
        newAccountLbl.text = AppHelper.getLocalizeString(str: "new_account_text")
        if selectedLanguage == "en" {
            selectedLanguageLbl.text = AppHelper.getLocalizeString(str: "en_language")

        }else{
            selectedLanguageLbl.text = AppHelper.getLocalizeString(str: "fr_language")
        }
        loginBtn.clipsToBounds = true
        loginBtn.layer.cornerRadius = 5
    }



    fileprivate func dropdownConfig() {
        dropDown.anchorView = languagesDropDown
        dropDown.dataSource = Constants.languages
        dropDown.direction = .bottom

        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)

        DropDown.appearance().selectionBackgroundColor = UIColor.lightGray
        dropDown.dismissMode = .onTap
        DropDown.appearance().cellHeight = 40

        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
           // print("Selected item: \(item) at index: \(index)")
            showAlert()
            if index == 0 {
                UserDefaults.standard.set("en", forKey: "Language")
                selectedLanguageLbl.text = AppHelper.getLocalizeString(str: "en_language")
            }else{
                UserDefaults.standard.set("fr", forKey: "Language")
                selectedLanguageLbl.text = AppHelper.getLocalizeString(str: "fr_language")
            }
        }

        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.showList))
        languagesDropDown.addGestureRecognizer(gesture)
    }

    fileprivate func showAlert() {
        let alert = UIAlertController(title: AppHelper.getLocalizeString(str: "restart_msg"), message: AppHelper.getLocalizeString(str: "change_language_success"), preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true)
    }

    @objc func showList(sender : UITapGestureRecognizer) {
        // Do what you want
        dropDown.show()
    }


    @IBAction func loginClick(_ sender: Any) {
    }

}
