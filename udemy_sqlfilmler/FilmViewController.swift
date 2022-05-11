//
//  FilmViewController.swift
//  udemy_sqlfilmler
//
//  Created by Eren Demir on 11.05.2022.
//

import UIKit

class FilmViewController: UIViewController {
    
    @IBOutlet weak var filmCollectionView: UICollectionView!
    var filmListesi = [Filmler]()
    var kategori:Kategoriler?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmCollectionView.dataSource = self
        filmCollectionView.delegate = self
        
        if let k = kategori {
            navigationItem.title = k.kategori_ad
            
            filmListesi = Filmlerdao().filmlerAl(kategori_id: k.kategori_id!)
        }
        
        
        //HÜCRE TASARIMI
        let tasarim:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let genislik = self.filmCollectionView.frame.size.width
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        let hucreGenislik = (genislik-30)/2
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik * 1.7)
        filmCollectionView!.collectionViewLayout = tasarim
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            print("toDetay")
            if let index = sender as? Int{
                let gidilecekVC = segue.destination as! DetayViewController
                gidilecekVC.film = filmListesi[index]
            }
        }
    }
}

extension FilmViewController:UICollectionViewDelegate,UICollectionViewDataSource,FilmHucreCollectionViewCellProtocol{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let gelenFilm = filmListesi[indexPath.row]
        let cell = filmCollectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! FilmCollectionViewCell
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        cell.filmFiyatLabel.text = "20.99 TL"
        cell.filmImageView.image = UIImage(named: gelenFilm.film_resim!)
        cell.filmAdLabel.text = gelenFilm.film_ad
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) Row: \(indexPath.row)")
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    func sepeteEkleFunc(indexPath: IndexPath) {
        print("Sepete Ekle Section: \(indexPath.section) Row: \(indexPath.row)")
    }
    
}
