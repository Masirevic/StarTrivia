//
//  Starship.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/18/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import Foundation


struct Starship: Codable {
    
    
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let speed: String
    let crew: String
    let passengers: String
    let cargo: String
    let tipe: String
    
    
    enum CodingKeys: String, CodingKey {
        
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
        case cargo = "cargo_capacity"
        case tipe = "starship_class"
        
        
    }
    
}


