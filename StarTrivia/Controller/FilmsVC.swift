//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Ljubomir Masirevic on 9/11/18.
//  Copyright © 2018 Ljubomir Masirevic. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var previousBtn: FadeEnabledBtn!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    
    
    var person: Person!
    var api = FilmApi()
    var film = [String]()
    var currentFilm = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        film = person.filmUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = film.count > 1
        guard let firstFilm = film.first else {return}
        getFilms(url: firstFilm)
  
        
        
    }
    
    func getFilms (url: String) {
        api.getFilm(url: url) { (film) in
            if let film = film {
                self.setUpUi(film: film)
            }
        }
    }
    
    func setUpUi (film: Film) {
        
        titleLbl.text = film.title
        episode.text = "\(film.episode)"
        directorLbl.text = film.director
        producerLbl.text = film.producer
        dateLbl.text = film.date
        
        
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        currentFilm -= 1
        setUpButtonState()
    }
    
    
    
    
    @IBAction func nextClicked(_ sender: Any) {
        currentFilm += 1
        setUpButtonState()
    }
    
    func setUpButtonState () {
        
        previousBtn.isEnabled = currentFilm == 0 ? false : true
        nextBtn.isEnabled = currentFilm == film.count - 1 ? false : true
        
        getFilms(url: film[currentFilm])
    
    }
    
}
