//
//  PersonTableViewCell.swift
//  StarWarsSearch
//
//  Created by Michael Stoffer on 5/23/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet var personLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var birthYearLabel: UILabel!

    var person: Person? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let person = self.person else { return }
        self.personLabel.text = person.name
        self.genderLabel.text = "Gender: \(person.gender)"
        self.birthYearLabel.text = "Birth Year: \(person.birthYear)"
    }
}
