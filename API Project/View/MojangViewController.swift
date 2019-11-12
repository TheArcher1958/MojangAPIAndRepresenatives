//
//  MojangViewController.swift
//  API Project
//
//  Created by Josh GImenes on 11/11/19.
//  Copyright © 2019 Josh Gimenes. All rights reserved.
//

import UIKit

class MojangViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let mojangController: MojangListController = MojangListNetworkController()
    var mojangListItem: MojangListItem = MojangListItem(name: "", id: "")
    let skinController = SkinListNetworkController()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mojangSearchBar: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self


        // Do any additional setup after loading the view.
    }
    

    @IBAction func mojangSearch(_ sender: Any) {
        if mojangSearchBar?.text != "", let mojangSearchText = mojangSearchBar.text {

            mojangController.getMojangList(username: mojangSearchText) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let mojangListItem):
                        print(mojangListItem)
                        self.mojangListItem = mojangListItem
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            
                        }
                        
                    case .failure:
                        let alert = UIAlertController(title: "Error", message: "Failed to load data", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mojangListItem.id != "", mojangListItem.name != "" {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mojangCell", for: indexPath)
        
        cell.textLabel?.text = mojangListItem.name
        cell.detailTextLabel?.text = mojangListItem.id
        skinController.fetchImage(uuid: mojangListItem.id) { image in
            DispatchQueue.main.async {
                cell.imageView?.image = image
            }
        }
        
        return cell
    }

}
