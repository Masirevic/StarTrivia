//
//  Constants.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/10/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import UIKit




let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.co/api/" 
let PERSON_URL = URL_BASE + "people/"


typealias PersonResponseCompletion = (Person?) -> ()
typealias HomeworldResponseCompletion = (Homeworld?) -> ()
typealias VehicleResponseCompletion = (Vehicle?) -> ()

