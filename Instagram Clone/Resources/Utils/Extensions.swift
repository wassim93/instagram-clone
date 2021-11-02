//
//  Extensions.swift
//  Instagram Clone
//
//  Created by wassim on 2/11/2021.
//

import Foundation

extension String{
    func safeDatabaseKey() -> String {
        return self.replacingOccurrences(of: "@", with: "-").self.replacingOccurrences(of: ".", with: "-")
    }
}
