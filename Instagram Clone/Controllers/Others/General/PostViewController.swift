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

    /*
     Section
      - Header Post cell
     Section
     - PostCell for the post content
     Section
     - Post Actions cell for action buttons
     Section
     - Post General cell  for comments
     */


    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "IgFeedPostCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostCell")
        tableview.register(UINib(nibName: "IgFeedPostHeaderCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostHeaderCell")
        tableview.register(UINib(nibName: "IgFeedPostActionsCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostActionsCell")
        tableview.register(UINib(nibName: "IgFeedPostGeneralCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostGeneralCell")

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
