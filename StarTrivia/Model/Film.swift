//
//  Film.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/18/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import Foundation


struct Film: Codable {
    
    let title: String
    let episode: Int
    let director: String
    let producer: String
    let date: String
    
    
    enum CodingKeys: String, CodingKey {

        case title
        case episode = "episode_id"
        case director
        case producer
        case date = "release_date"

    }
    
}
