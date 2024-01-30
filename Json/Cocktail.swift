//
//  Cocktail.swift
//  Json
//
//  Created by Александр Соколов on 31.01.2024.
//

import Foundation

struct Cocktail: Decodable {
    let drinks: [Cocktail]
}
