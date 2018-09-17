//
//  Person.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/10/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import Foundation


struct Person : Codable {
    
    var name: String
    var height: String
    var mass: String
    let hair: String
    let birthYear: String
    let gender: String
    let homeworldUrl: String
    let filmUrls: [String]
    let vehicleUrls: [String]
    let starshipUrls: [String]
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender
        case homeworldUrl = "homeworld"
        case filmUrls = "films"
        case vehicleUrls = "vehicles"
        case starshipUrls = "starships"
   }

}



