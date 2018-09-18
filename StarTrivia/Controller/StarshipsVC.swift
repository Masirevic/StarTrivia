//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/11/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var maker: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var lenght: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var crew: UILabel!
    @IBOutlet weak var passengers: UILabel!
    @IBOutlet weak var cargo: UILabel!
    @IBOutlet weak var tipe: UILabel!
    @IBOutlet weak var previousLbl: BlackBGButton!
    @IBOutlet weak var nextLbl: BlackBGButton!
    
    
    var person: Person!
    var api = StarshipApi()
    var starships = [String]()
    var currentStarship = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipUrls
        previousLbl.isEnabled = false
        nextLbl.isEnabled = starships.count > 1
        guard let firstStarship = starships.first else {return}
        getStarshp(url: firstStarship)
        
    }
    

    
    func getStarshp(url: String) {
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.updateUi(starship: starship)
            }
        }
    }
    
    
    func updateUi(starship: Starship) {
        
        name.text = starship.name
        model.text = starship.model
        maker.text = starship.manufacturer
        cost.text = starship.cost
        lenght.text = starship.length
        speed.text = starship.speed
        crew.text = starship.crew
        passengers.text = starship.passengers
        cargo.text = starship.cargo
        tipe.text = starship.tipe
        
    }
    
    
    @IBAction func previousBtn(_ sender: Any) {
        currentStarship -= 1
        setUpButtonState()
    }
    
    
    @IBAction func nextBtn(_ sender: Any) {
        currentStarship += 1
        setUpButtonState()
    }
    
    func setUpButtonState () {
        
        previousLbl.isEnabled = currentStarship == 0 ? false : true
        nextLbl.isEnabled = currentStarship == starships.count - 1 ? false : true
        
        getStarshp(url: starships[currentStarship])
    }
    
}
