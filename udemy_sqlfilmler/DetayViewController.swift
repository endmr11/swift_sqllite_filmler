//
//  DetayViewController.swift
//  udemy_sqlfilmler
//
//  Created by Eren Demir on 11.05.2022.
//

import UIKit

class DetayViewController: UIViewController {

    @IBOutlet weak var detayFilmImageView: UIImageView!
    @IBOutlet weak var detayFilmAdLabel: UILabel!
    @IBOutlet weak var detayFilmTarihLabel: UILabel!
    @IBOutlet weak var detayFilmKategoriLabel: UILabel!
    @IBOutlet weak var detayFilmYonetmenLabel: UILabel!
    var film: Filmler?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let f = film {
            navigationItem.title = f.film_ad
            detayFilmImageView.image = UIImage(named: f.film_resim!)
            detayFilmAdLabel.text = f.film_ad
            detayFilmTarihLabel.text = "\(f.film_yil!)"
            detayFilmKategoriLabel.text = f.kategori?.kategori_ad
            detayFilmYonetmenLabel.text = f.yonetmen?.yonetmen_ad
        }
    }
    



}
