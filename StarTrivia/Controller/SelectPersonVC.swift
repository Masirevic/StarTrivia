//
//  ViewController.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/10/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    
    var personApi = PersonApi()
    var person1: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

   }
    
    
    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1...87)
        personApi.getRandomPersonAlamo(id: random) { (person) in
            if let person = person {
                self.setupView(person: person)
                self.person1 = person
            }

        }
    }
    
    
    func setupView (person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        starshipBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        homeworldBtn.isEnabled = !person.homeworldUrl.isEmpty
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person1
        }
        
//        switch segue.identifier {
//        case Segue.homeworld.rawValue:
//            if let destination = segue.destination as? HomeWorldVC {
//                destination.person = person1
//            }
//        case Segue.vehicles.rawValue:
//            if let destination = segue.destination as? VehiclesVC {
//                destination.person = person1
//            }
//        case Segue.starship.rawValue:
//            if let destination = segue.destination as? StarshipsVC {
//                destination.person = person1
//            }
//        case Segue.films.rawValue:
//            if let destination = segue.destination as? FilmsVC {
//                destination.person = person1
//            }
//        default:
//            break
//        }
        
        
//        if segue.identifier == "toHomeworld" {
//            if let destination = segue.destination as? HomeWorldVC {
//                destination.person = person1
//            }
//        }  else if segue.identifier == "toVehicles" {
//                if let destination = segue.destination as? VehiclesVC {
//                    destination.person = person1
//                }
//        } else if segue.identifier == "toStarships" {
//            if let destination = segue.destination as? StarshipsVC {
//                destination.person = person1
//            }
//        } else if segue.identifier == "toFilms" {
//            if let destination = segue.destination as? FilmsVC {
//                destination.person = person1
//            }
//        }
        
    }
    
//    enum Segue: String {
//        case homeworld = "toHomeworld"
//        case vehicles = "toVehicles"
//        case starship = "toStarships"
//        case films = "toFilms"
//    }
}


protocol PersonProtocol{
    var person: Person! {get set}
}



