//
//  Location.swift
//  WeatherApp
//
//  Created by Kevin FORTES on 03/12/2019.
//  Copyright © 2019 Kevin FORTES. All rights reserved.
//

import Foundation
import CoreLocation

class Location: NSObject, NSCoding {
    var name: String?
    var latitude: Double!
    var longitude: Double!
    private let nameKey = "name"
    private let latitudeKey = "latitude"
    private let longitudeKey = "longitude"
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: nameKey)
        coder.encode(latitude, forKey: latitudeKey)
        coder.encode(longitude, forKey: longitudeKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let latitude = aDecoder.decodeObject(forKey: latitudeKey) as? Double,
            let longitude = aDecoder.decodeObject(forKey: longitudeKey) as? Double else {
            return nil
        }
        self.name = aDecoder.decodeObject(forKey: nameKey) as? String
        self.longitude = longitude
        self.latitude = latitude
    }
    
}
