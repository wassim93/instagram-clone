//
//  PostViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

class PostViewController: UIViewController {

    //FIXME: missing custom cell for this tableview

    @IBOutlet weak var tableview: UITableView!
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
        tableview.delegate = self
        tableview.dataSource = self
    }
    


}


extension PostViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableview.dequeueReusableCell(withIdentifier: "", for: indexPath)

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
    }


}
