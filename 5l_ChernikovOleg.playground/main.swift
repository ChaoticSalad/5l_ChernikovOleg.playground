//
//  main.swift
//  5l_ChernikovOleg.playground
//
//  Created by Олег Черников on 02.03.2022.
//

import Foundation

enum CarBrands{
    case mitsubishi, dodge, toyota, lada
}

enum EngineStates{
    case running, off
}

enum WindowsStates{
    case up, down
}

enum TrunkSpace: Int{
    case pickup = 10
    case truck = 15
    case cargo = 30
}

enum TrunkLoaded{
    case loaded, empty
}

enum Engines: Int{
    case v6 = 300
    case v8 = 400
    case v12 = 600
}

enum Tunes{
    case none, drift, stance, drag
}

protocol Car :CustomStringConvertible{
    var brand: CarBrands { get }
    var engine: EngineStates { get set }
    var windows: WindowsStates { get set }
    
    func whatAreYou() -> String
}

extension Car{
    
    mutating func engineControl(_ control:EngineStates){
        engine = control
    }
    
    mutating func windowsControl(_ control:WindowsStates){
        windows = control
    }
    
    func whatAreYou() -> String{
        return """
        My brand is \(brand)
        My engine is \(engine)
        My windows are \(windows)
        """
    }
}

class TrunkCar:Car{
    var description: String
    
    let brand: CarBrands
    var engine: EngineStates
    var windows: WindowsStates
    
    private let trunkSpace: TrunkSpace
    private var trunkLoaded: TrunkLoaded
    
    init(brand: CarBrands, engine: EngineStates, windows: WindowsStates, trunkSpace: TrunkSpace, description: String) {
        self.brand = brand
        self.engine = engine
        self.windows = windows
        self.trunkSpace = trunkSpace
        self.trunkLoaded = .empty
        self.description = description
    }
    
    func whatInUrTrunk() -> String {
        return "My trunk is \(self.trunkSpace.rawValue) litres and I'm \(self.trunkLoaded)"
    }
}

class SportCar: Car{
    var description: String
    
    let brand: CarBrands
    var engine: EngineStates
    var windows: WindowsStates
    
    private let hp: Engines
    private var modified: Tunes
    
    init(brand: CarBrands, engine: EngineStates, windows: WindowsStates, hp: Engines, description: String) {
        self.brand = brand
        self.engine = engine
        self.windows = windows
        self.hp = hp
        self.modified = .none
        self.description = description
    }
    
    func whatsUndrHood() -> String {
        return "Engine: \(self.hp), modified: \(self.modified)"
    }
}

extension TrunkCar{
    func printDescription(){
        print("I'm with trunk and I'm \(description)")
    }
}

extension SportCar{
    func printDescription(){
        print("I'm sport and I'm \(description)")
    }
}



var toyo = TrunkCar(brand: .toyota, engine: .off, windows: .up, trunkSpace: .pickup, description: "toyo")

print(toyo.whatAreYou())
print(toyo.whatInUrTrunk())

toyo.printDescription()

var mitsu = SportCar(brand: .mitsubishi, engine: .off, windows: .up, hp: .v6, description: "mitsu")

mitsu.engineControl(.running)

print(mitsu.whatAreYou())
print(mitsu.whatsUndrHood())

mitsu.printDescription()

