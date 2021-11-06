//
//  PostViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

class PostViewController: UIViewController {


    var model:UserPost?
    init(model:UserPost?) {
        self.model =  model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.model = nil
        super.init(coder: coder)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


}
