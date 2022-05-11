//
//  Kategoriler.swift
//  udemy_sqlfilmler
//
//  Created by Eren Demir on 11.05.2022.
//

import Foundation

class Kategoriler {
    var kategori_id:Int?
    var kategori_ad:String?
    
    init() {
        
    }
    
    init(kategori_id:Int,kategori_ad:String) {
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}
