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

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    let dropDown = DropDown()

    struct Constants {
        static let languages = ["English,United States", "French,France"]
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        dropdownConfig()
        loginBtn.clipsToBounds = true
        loginBtn.layer.cornerRadius = 5



        // Do any additional setup after loading the view.
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
            //print("Selected item: \(item) at index: \(index)")
            selectedLanguageLbl.text = item
        }

        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.showList))
        languagesDropDown.addGestureRecognizer(gesture)
    }

    @objc func showList(sender : UITapGestureRecognizer) {
        // Do what you want
        dropDown.show()
    }


    @IBAction func loginClick(_ sender: Any) {
    }

}
