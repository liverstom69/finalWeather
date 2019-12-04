//
//  UserData.swift
//  WeatherApp
//
//  Created by Kevin FORTES on 03/12/2019.
//  Copyright © 2019 Kevin FORTES. All rights reserved.
//

import Foundation

class UserData {
    
    static let shared = UserData()
    
    private let citiesKey = "weatherapp.cities"
    private let weatherKey = "weatherapp.weathers"
    
    var cities: [Location] {
        get {
            guard let cityData = UserDefaults.standard.object(forKey: citiesKey) as? Data,
                let cities = NSKeyedUnarchiver.unarchiveObject(with: cityData) as? [Location] else {
                return [Location]()
            }
            return cities
        }
    }
    
    var weathers: [Weather] {
        get {
            guard let weatherData = UserDefaults.standard.object(forKey: weatherKey) as? Data,
                let weathers = try? JSONDecoder().decode([Weather].self, from: weatherData) as? [Weather] else {
                return [Weather]()
            }
            return weathers
        }
    }

    func add(city: Location) {
        var cities = self.cities
        cities.append(city)
        let cityData = NSKeyedArchiver.archivedData(withRootObject: cities)
        UserDefaults.standard.set(cityData, forKey: citiesKey)
        UserDefaults.standard.synchronize()
    }
    
    func set(weathers: [Weather]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(weathers) {
            let str = String(decoding: encoded, as: UTF8.self).data(using: .utf8)
            UserDefaults.standard.set(str, forKey: weatherKey)
            UserDefaults.standard.synchronize()
        }
    }

    private init() {}
    
}
