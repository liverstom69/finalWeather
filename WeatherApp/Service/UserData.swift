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
    
    var cities: [Location] {
        get {
            guard let cityData = UserDefaults.standard.object(forKey: citiesKey) as? Data,
                let cities = NSKeyedUnarchiver.unarchiveObject(with: cityData) as? [Location] else {
                return [Location]()
            }
            return cities
        }
    }

    func add(city: Location) {
        var cities = self.cities
        cities.append(city)
        let cityData = NSKeyedArchiver.archivedData(withRootObject: cities)
        UserDefaults.standard.set(cityData, forKey: citiesKey)
    }

    private init() {}
    
}
