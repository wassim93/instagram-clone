//
//  AppHelper.swift
//  Instagram Clone
//
//  Created by wassim on 1/11/2021.
//

import Foundation

class AppHelper: NSObject {

    static func getLocalizeString(str:String) -> String {
        let string = Bundle.main.path(forResource: UserDefaults.standard.string(forKey: "Language"), ofType: "lproj")
        let myBundle = Bundle(path: string!)
        return (myBundle?.localizedString(forKey: str, value: "", table: nil))!
    }
}
