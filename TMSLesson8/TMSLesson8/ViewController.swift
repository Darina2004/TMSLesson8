//
//  ViewController.swift
//  TMSLesson8
//
//  Created by Mac on 18.12.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var LabelIppa: UILabel!
    @IBOutlet weak var LabelOldAle: UILabel!
    @IBOutlet weak var LabelTalus: UILabel!
    @IBOutlet weak var LabelStout: UILabel!
    @IBOutlet weak var LabelRevenu: UILabel!
    @IBOutlet weak var SoldBeer: UILabel!
    
    @IBOutlet weak var ButtonIPPA: UIButton!
    @IBOutlet weak var ButtonTalus: UIButton!
    @IBOutlet weak var ButtonStaut: UIButton!
    @IBOutlet weak var ButtonOldAle: UIButton!
    @IBOutlet weak var ButtonEndDay: UIButton!
    
    let myBeer = Beer(name: "", price: 2.5, country: "", volume: 10)
    let myBeer2 = Beer(name: "", price: 2.0, country: "", volume: 10)
    let myBeer3 = Beer(name: "", price: 3.0, country: "", volume: 10)
    let myBeer4 = Beer(name: "", price: 4.0, country: "", volume: 10)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SoldBeer.isHidden = true
        SoldBeer.textColor = UIColor.white
        
        
        
    }
    
    @IBAction func ButtonIppaSetup(_ sender: Any) {
        ButtonIPPA.addTarget(self, action: #selector(IppaTapped), for: .touchUpInside)
        
    }
    
    @IBAction func ButtonOldAleSetup(_ sender: Any) {
        ButtonOldAle.addTarget(self, action: #selector(OldAleTapped), for: .touchUpInside)
    }
    
    
    @IBAction func ButtonTalusSetup(_ sender: Any) {
        
        ButtonTalus.addTarget(self, action: #selector(TalusTapped), for: .touchUpInside)
    }
    
    @IBAction func ButtonStautSetup(_ sender: Any) {
        ButtonStaut.addTarget(self, action: #selector(StoutTapped), for: .touchUpInside)
    }
    
    @IBAction func ButtonEndDaySetup(_ sender: Any) {
        ButtonEndDay.addTarget(self, action: #selector(EndDayTapped), for: .touchUpInside)
        ButtonEndDay.setTitleColor(UIColor.brown, for: .normal)
    }
    
    
    
    func addSubviews() {
        self.view.addSubview(LabelIppa)
        self.view.addSubview(ButtonIPPA)
        self.view.addSubview(ButtonOldAle)
        self.view.addSubview(ButtonTalus)
        self.view.addSubview(ButtonStaut)
        self.view.addSubview(ButtonEndDay)
    }
    
    
    @IBAction func EndDayTapped(_ sender: UIButton) {
        let (totalSoldBeears, revenue) = BeerManager.shared.endDay()
        SoldBeer.isHidden = false
        SoldBeer.text = "ПИВА ПРОДАНО: \(totalSoldBeears)"
        ButtonEndDay.setTitle("НАЧАЛО ДНЯ", for: .normal)
        LabelRevenu.text = "ВЫРУЧКА: \(BeerManager.shared.getTodayRevenue())"
        BeerManager.shared.resetTodayRevenue()
        BeerManager.shared.resetStock(beer: myBeer)
        LabelIppa.text = "\(myBeer.price)$      \(myBeer.volume) L"
        LabelOldAle.text = "\(myBeer.price)$      \(myBeer.volume) L"
        LabelTalus.text = "\(myBeer.price)$      \(myBeer.volume) L"
        LabelStout.text = "\(myBeer.price)$      \(myBeer.volume) L"
        
    }
    @IBAction func IppaTapped(_ sender: UIButton) {
        
        if let ippaBeer = BeerManager.shared.beers.first(where: { $0.name == "IPA" }) {
            BeerManager.shared.sellBeer(beer: ippaBeer)
            LabelIppa.text =  "\(ippaBeer.price)$      \(ippaBeer.volume)L"
            LabelRevenu.text =  "\(BeerManager.shared.getTodayRevenue())$"
            SoldBeer.text = "\(BeerManager.shared.totalSoldBeers)"
            
        }
    }
    
    @IBAction func OldAleTapped(_sender: UIButton){
        
        if let oldAleBeer = BeerManager.shared.beers.first(where: { $0.name == "OldAle" }) {
            BeerManager.shared.sellBeer(beer: oldAleBeer)
            LabelOldAle.text =  "\(oldAleBeer.price)$      \(oldAleBeer.volume)L"
            LabelRevenu.text =  "\(BeerManager.shared.getTodayRevenue())$"
            SoldBeer.text = "\(BeerManager.shared.totalSoldBeers)"
            
        }
        
    }
    
    @IBAction func TalusTapped(_sender: UIButton){
        
        if let talusBeer = BeerManager.shared.beers.first(where: { $0.name == "TALUS" }) {
            BeerManager.shared.sellBeer(beer: talusBeer)
            LabelTalus.text =  "\(talusBeer.price)$      \(talusBeer.volume)L"
            LabelRevenu.text =  "\(BeerManager.shared.getTodayRevenue())$"
            SoldBeer.text = "\(BeerManager.shared.totalSoldBeers)"
            
        }
        
    }
    @IBAction func StoutTapped(_sender: UIButton){
        
        if let stoutBeer = BeerManager.shared.beers.first(where: { $0.name == "STOUT" }) {
            BeerManager.shared.sellBeer(beer: stoutBeer)
            LabelStout.text =  "\(stoutBeer.price)$      \(stoutBeer.volume)L"
            LabelRevenu.text =  "\(BeerManager.shared.getTodayRevenue())$"
            SoldBeer.text = "Пива продано: \(BeerManager.shared.totalSoldBeers)"
            
        }
        
    }
    
    
    
}










