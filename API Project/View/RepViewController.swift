//
//  RepViewController.swift
//  API Project
//
//  Created by Josh GImenes on 11/11/19.
//  Copyright © 2019 Josh Gimenes. All rights reserved.
//

import UIKit

class RepViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var repSearchBar: UITextField!
    
    let repController: RepListController = RepListNetworkController()
    var repList: RepList = RepList(results: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.delgate = self
        self.tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func repSearch(_ sender: Any) {
        if repSearchBar?.text != "", let repSearchText = repSearchBar.text {
            repController.getRepList(zip: repSearchText) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let repList):
                        print(repList)
                        self.repList = repList
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
        return repList.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "aCell", for: indexPath) as? RepTableViewCell else { return UITableViewCell() }
        
        cell.nameLabel?.text = repList.results[indexPath.row].name
        cell.partyLabel?.text = repList.results[indexPath.row].party
        cell.stateLabel?.text = repList.results[indexPath.row].state
        cell.phoneLabel?.text = repList.results[indexPath.row].phone
        
        return cell
    }

    

}
