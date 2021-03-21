//
//  main.swift
//  Lesson5
//
//  Created by Air on 20.03.2021.
//

import Foundation

enum Engine {
    case start, over
}
enum Window {
    case open, close
}
enum Luggage: String {
    case fill = "загрузить"
    case upload = "выгрузить"
}
enum AnotherTruck: String {
    case big = "66-дюймовые"
    case small = "40-дюймовые"
}
enum AnotherSport {
    case open, close
}

protocol Car {
    var brand: String {get}
    var year: String {get}
    var baggage: String {get}
    var engine: Engine {get set}
    var window: Window {get set}
    var fullemptyBaggage: Luggage {get set}
}
extension Car {
    mutating func changeEngineState(engineState: Engine){
        self.engine = engineState
    }
    mutating func chageWindowState(windowsState: Window){
         self.window = windowsState
     }
 }

class firstCar: Car {
    let brand: String
    let year: String
    let baggage: String
    var engine: Engine = .over
    var window: Window = .close
    var fullemptyBaggage: Luggage = .fill
    
    init(brand: String, ago: String, baggage: String) {
             self.brand = brand
             self.year = ago
             self.baggage = baggage
         }
}

class sportCar: Car, CustomStringConvertible{
        var brand: String
        var year: String
        var baggage: String
        var engine: Engine
        var window: Window
        var fullemptyBaggage: Luggage
        var openingRoof: AnotherSport = .open
        var description: String{
            return "Brand is \(brand), release date is \(year), engine is \(engine), windows is \(window), roof is \(openingRoof)"
         }
        init(brand: String, release: String, baggages: String, engine: Engine, windows: Window, fullemptyBaggage: Luggage) {
                 self.brand = brand
                 self.year = release
                 self.baggage = baggages
                 self.engine = engine
                 self.window = windows
                 self.fullemptyBaggage = fullemptyBaggage
        }
 }

class truckCar: Car, CustomStringConvertible{
        var brand: String
        var year: String
        var baggage: String
        var engine: Engine
        var window: Window
        var fullemptyBaggage: Luggage
    var wheelSize: AnotherTruck = .big
        var description: String{
             return "Brand is \(brand), release date is \(year), engine is \(engine), windows is \(window), wheel size \(wheelSize)"
         }
    init(brand: String, release: String, baggages: String, engine: Engine, windows: Window, fullemptyBaggage: Luggage) {
             self.brand = brand
             self.year = release
             self.baggage = baggages
             self.engine = engine
             self.window = windows
             self.fullemptyBaggage = fullemptyBaggage
    }
}

var bmw = sportCar(brand: "BMW", release: "2012 год", baggages: "200 литров", engine: .start, windows: .open, fullemptyBaggage: .fill)
var audi = truckCar(brand: "Audi", release: "2000 год", baggages: "500 литров", engine: .over, windows: .close, fullemptyBaggage: .upload)
bmw.changeEngineState(engineState:.start)
bmw.openingRoof = .open
audi.chageWindowState(windowsState: .open)
audi.wheelSize = .small
print(bmw.description)
print(audi.description)
//изменения
