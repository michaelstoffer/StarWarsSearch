//
//  StarWarsSearchTableViewController.swift
//  StarWarsSearch
//
//  Created by Michael Stoffer on 5/23/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class StarWarsSearchTableViewController: UITableViewController {
    
    // MARK: - @IBOutlets and Variables
    @IBOutlet var searchBar: UISearchBar!
    
    let personController = PersonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personController.people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }

        let person = self.personController.people[indexPath.row]
        cell.person = person

        return cell
    }
}

extension StarWarsSearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = self.searchBar.text else { return }
        self.personController.searchForPeopleWith(searchTerm: searchTerm) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
