//
//  ViewController.swift
//  udemy_sqlfilmler
//
//  Created by Eren Demir on 11.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var kategorilerTableView: UITableView!
    var kategorilerListe = [Kategoriler]()
    override func viewDidLoad() {
        super.viewDidLoad()
        veritabaniKopyala()
        kategorilerTableView.delegate = self
        kategorilerTableView.dataSource = self
        kategorilerListe = Filmlerdao().tumKategorileriAl()
    }
    
    func veritabaniKopyala() {
        let bundleYol = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYol = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler.sqlite")
        if fileManager.fileExists(atPath: kopyalanacakYol.path){
            print("Veritabanı zaten var.")
        }else{
            do {
                try fileManager.copyItem(at: URL(fileURLWithPath: bundleYol!), to: URL(fileURLWithPath: kopyalanacakYol.path))
            }catch{
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFilm" {
            print("toFilm")
            if let index = sender as? Int{
                let gidilecekVC = segue.destination as! FilmViewController
                gidilecekVC.kategori = kategorilerListe[index]
            }
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kategorilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gelenKategori = kategorilerListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kategoriHucre", for: indexPath) as! KategoriTableViewCell
        cell.kategoriAdLabel.text = gelenKategori.kategori_ad
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        self.performSegue(withIdentifier: "toFilm", sender: indexPath.row)
    }
}
