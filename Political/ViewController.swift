//
//  ViewController.swift
//  Political
//
//  Created by Prudhvi Gadiraju on 4/24/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    // MARK: - Properties
    
    var petitions = [Petition]()
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPetitions()
    }
    
    // MARK: - API
    
    fileprivate func fetchPetitions() {
        Networking.fetchPetitions { [weak self](result) in
            switch result {
            case .success(let petitions):
                self?.petitions = petitions.results
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to Fetch Petitions", error.localizedDescription)
            }
        }
    }
}

// MARK: - Table View

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
}

