//
//  Person.swift
//  StarWarsSearch
//
//  Created by Michael Stoffer on 5/23/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import Foundation

struct Person: Decodable {
    let name: String
    let gender: String
    let birthYear: String
}

struct PersonSearch: Decodable {
    let results: [Person]
}
