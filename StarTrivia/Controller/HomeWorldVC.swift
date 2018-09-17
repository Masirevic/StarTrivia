//
//  HomeWorldVC.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/11/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import UIKit

class HomeWorldVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    
    var person: Person!
    var api = HomeworldApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        api.getHomeworld(url: person.homeworldUrl) { (homeworld) in
            if let homeworld = homeworld {
             self.setupUi(homeworld: homeworld)
            }
        }
        
        
    }
    

    func setupUi (homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
   

}
