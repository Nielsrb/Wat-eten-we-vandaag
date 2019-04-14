//
//  DishModel.swift
//  Wat eet ik vandaag?
//
//  Created by Niels Beeuwkes on 14/04/2019.
//  Copyright © 2019 Niels Beeuwkes. All rights reserved.
//

import Foundation

struct Dish: Codable {
    let name: String
    let id: Int
    let ingredients: [String]
    let procedure: String
    let rating: Int
    let picture: String
    let source: String
}
