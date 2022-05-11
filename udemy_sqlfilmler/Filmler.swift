//
//  Filmler.swift
//  udemy_sqlfilmler
//
//  Created by Eren Demir on 11.05.2022.
//

import Foundation

class Filmler {
    var film_id:Int?
    var film_ad:String?
    var film_resim:String?
    var film_yil:Int?
    var kategori:Kategoriler?
    var yonetmen:Yonetmenler?
    
    
    init() {
        
    }
    
    init(film_id:Int,film_ad:String,film_resim:String,film_yil:Int,kategori:Kategoriler,yonetmen:Yonetmenler) {
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_resim = film_resim
        self.film_yil = film_yil
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
}
