//
//  VehicleApi.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/14/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import Foundation
import Alamofire

class VehicleApi {
    
    func getVehicle(url: String, completion: @escaping VehicleResponseCompletion) {   // func get specific data
        
        guard let url = URL(string: url) else {return} // If there is url
        
        Alamofire.request(url).responseJSON { (response) in   // Alamofire request
            
            if let error = response.result.error {             // if there is error
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else {return completion (nil)}   // if there is data
            let josnDecoder = JSONDecoder()
            
            
            do {
                let vehicle = try josnDecoder.decode(Vehicle.self, from: data)       // try to decode
                completion(vehicle)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
}



