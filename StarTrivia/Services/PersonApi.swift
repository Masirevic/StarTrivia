//
//  PersonApi.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/10/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonApi {
    
    
    
////////////////////Web request with Alamofire and Codable
    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else {return}
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else {
                return completion(nil)}
            
            let  jsonDecoder = JSONDecoder()
            
            do {
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
////////////////////// Web Request with Alamofire and SwiftyJSON
//    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
//
//        guard let url = URL(string: "\(PERSON_URL)\(id)") else {return}
//
//        Alamofire.request(url).responseJSON { (response) in
//            if let error = response.result.error {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//                return
//            }
//
//            guard let data = response.data else {
//                return completion(nil)}
//
//            do {
//                let json = try JSON(data: data)
//                let person = self.parsPersonSwifty(json: json)
//                completion(person)
//            } catch {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//            }
//        }
//    }
//////////////////// Web Request with Alamofire
//    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
//
//        guard let url = URL(string: "\(PERSON_URL)\(id)") else {return}
//
//        Alamofire.request(url).responseJSON { (response) in
//            if let error = response.result.error {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//                return
//            }
//
//            guard let json = response.result.value as? [String: Any] else {
//                return completion(nil)}
//
//                let person = self.parsPersonManual(json: json)
//                completion(person)
//
//        }
//    }
    
    
////////////////// Web request with URL Session
//    func getRandomPersonUrlSession (id: Int, completion: @escaping PersonResponseCompletion) {
//
//        guard let url = URL(string: "\(PERSON_URL)\(id)") else {return}
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            guard error == nil else {
//                debugPrint(error.debugDescription)
//                completion(nil)
//                return
//            }
//
//            guard let data = data else {return}
//
//            do {
//                let jsonAny = try JSONSerialization.jsonObject(with: data, options: []) // get json data from data
//                guard let json = jsonAny as? [String: Any] else {return} // cast json data as dictionary
//                let person = self.parsPersonManual(json: json) // parsin json in usable data
//                DispatchQueue.main.async {
//                     completion(person)                       // back on main thread
//                }
//
//
//            } catch {
//                debugPrint(error.localizedDescription)
//                return
//            }
//
//        }
//        task.resume()
//
//    }
//////////////////////////Parsing data manualy
//    private func parsPersonManual(json: [String: Any]) -> Person {        // Pasing data manualy
//        let name = json["name"] as? String ?? ""
//        let height = json ["height"] as? String ?? ""
//        let mass = json["mass"] as? String ?? ""
//        let hair = json["hair_color"] as? String ?? ""
//        let birthYear = json["birth_year"] as? String ?? ""
//        let gender = json["gender"] as? String ?? ""
//        let homeworldUrl = json["homeworld"] as? String ?? ""
//        let filmsUrls = json["films"] as? [String] ?? [String] ()
//        let vehicleUrls = json["vehicles"] as? [String] ?? [String] ()
//        let starshipUrls = json["starships"] as? [String] ?? [String] ()
//
//        let person = Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmsUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
//
//        return person
//    }
    
    
//////////////////////////Parsing SwiftyJSON way
//    private func parsPersonSwifty(json: JSON) -> Person {        // Pasing data manualy
//        let name = json["name"].stringValue
//        let height = json ["height"].stringValue
//        let mass = json["mass"].stringValue
//        let hair = json["hair_color"].stringValue
//        let birthYear = json["birth_year"].stringValue
//        let gender = json["gender"].stringValue
//        let homeworldUrl = json["homeworld"].stringValue
//        let filmsUrls = json["films"].arrayValue.map {$0.stringValue}
//        let vehicleUrls = json["vehicles"].arrayValue.map {$0.stringValue}
//        let starshipUrls = json["starships"].arrayValue.map {$0.stringValue}
//        
//        let person = Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmsUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
//        
//        return person
//    }
    
}





