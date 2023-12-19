//
//  BeerManager.swift
//  TMSLesson8
//
//  Created by Mac on 18.12.23.
//

import Foundation

class BeerManager {
    static let shared = BeerManager()
    private var revenue: Double = 0 // Выручка
    private init() {}
    
    
    
    var beers: [Beer] = [
        Beer(name: "IPA", price: 2.5, country: "", volume: 10),
        Beer(name: "STOUT", price: 4, country: "", volume: 10),
        Beer(name: "TALUS", price: 3, country: "", volume: 10),
        Beer(name: "OldAle", price: 2, country: "", volume: 10)
    ]
    
    var todayRevenue: Double = 0
    var totalSoldBeers: Int = 0
  
    
    
    
    func sellBeer(beer: Beer) {
        if beer.volume > 0 {
            beer.volume -= 1
            revenue += beer.price
            todayRevenue += beer.price
            totalSoldBeers += 1
            
        }
    }
    
    func endDay() -> (totalSoldBeers: Int, revenue: Double ) {
        
        let totalSoldBeers = self.totalSoldBeers
        let revenue = self.revenue
        self.totalSoldBeers = 0
        self.revenue = 0
        return (totalSoldBeers, revenue)
    }
    
    
    func resetStock(beer: Beer) {
        beer.volume = 10
    }
    
    func getTodayRevenue() -> Double {
        return todayRevenue
    }
    
    func resetTodayRevenue() {
        todayRevenue = 0
    }
    
    
    
}

