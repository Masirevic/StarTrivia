//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/11/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var lenght: UILabel!
    @IBOutlet weak var maxSpeed: UILabel!
    @IBOutlet weak var crew: UILabel!
    @IBOutlet weak var passengers: UILabel!
    @IBOutlet weak var previous: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!
    
    var api = VehicleApi()
    
    var vehicles = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrls
        guard let firstVehicle = vehicles.first else {return}
        getVehicle(url: firstVehicle)
    
    }
    
    
    func getVehicle(url: String){
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setupUi(vehicle: vehicle)
            }
        }
        
    }
    
    func setupUi (vehicle: Vehicle) {
        
        name.text = vehicle.name
        model.text = vehicle.model
        manufacturer.text = vehicle.manufacturer
        cost.text = vehicle.cost
        lenght.text = vehicle.length
        maxSpeed.text = vehicle.speed
        crew.text = vehicle.crew
        passengers.text = vehicle.passengers
        
        
        
        
    }

    @IBAction func previousClicked(_ sender: Any) {
        
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
       
    }
    
}
