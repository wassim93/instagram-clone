//
//  AppHelper.swift
//  Instagram Clone
//
//  Created by wassim on 1/11/2021.
//

import Foundation
import UIKit

class AppHelper: NSObject {

    static func getLocalizeString(str:String) -> String {
        let string = Bundle.main.path(forResource: UserDefaults.standard.string(forKey: "Language"), ofType: "lproj")
        let myBundle = Bundle(path: string!)
        return (myBundle?.localizedString(forKey: str, value: "", table: nil))!
    }

    /// function to return initialized  view controller from the storyboard
    /// - parametres
        /// - stroyboardName : String
        /// - vcIdentifier : View controller identifier
    /// return  the initialized view controller
    static func initVcFromStoryboard(storyboardName: String,vcIdentifier: String) -> UIViewController{
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: vcIdentifier)
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
}
