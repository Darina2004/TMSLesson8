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



private var beers: [Beer] = [
        Beer(name: "IPA", price: 3.5, quantity: 20),
        Beer(name: "Stout", price: 4.0, quantity: 15),
        Beer(name: "Talus", price: 3.0, quantity: 25)
        Beer(name: "OldAle", price: 3.0, quantity: 25)
    ]
    private var soldBeers: [Int] = Array(repeating: 0, count: 4)
    private var todayRevenue: Double = 0 // добавляем свойство для хранения выручки за сегодня


func sellBeer(at index: Int) {
    guard index >= 0 && index < beers.count else {
        return
    }
    let beer = beers[index]
    guard beer.volume > 0 else {
        return
    }
    beer.volume -= 1
    soldBeers[index] += 1
    revenue += beer.price
    todayRevenue += beer.price // добавляем выручку за проданное пиво к выручке за сегодня
}

func endDay() -> (soldBeers: [Int], revenue: Double) {
    let soldBeers = self.soldBeers
    let revenue = self.revenue
    self.soldBeers = Array(repeating: 0, count: 4)
    self.revenue = 0
    return (soldBeers, revenue)
}


 
    func getTodayRevenue() -> Double { // добавляем метод для получения выручки за сегодня
        return todayRevenue
    }

    func resetTodayRevenue() { // добавляем метод для обнуления выручки за сегодня
        todayRevenue = 0
    }



}
