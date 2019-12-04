//
//  Weather.swift
//  WeatherApp
//
//  Created by Kevin FORTES on 03/12/2019.
//  Copyright © 2019 Kevin FORTES. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let time: Int?
    let icon: String?
    let temperature: Double?
    let windSpeed: Double?
    let humidity: Float?
    let pressure: Double?
    let cloudCover: Float?
    let uvIndex: Int?
    let defaultValue = "-"
    
    lazy var iconName: String = {
        guard let icon = self.icon else {
            return "picto_100"
        }
        switch icon {
        case "clear-day":
            return "picto_101"
        case "rain":
            return "picto_107"
        case "snow":
            return "picto_111"
        case "fog":
            return "picto_114"
        default:
            return "picto_100"
        }
    }()
    
    lazy var dateString: String = {
        guard let time = self.time else {
            return self.defaultValue
        }
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE d"
        return dateFormatter.string(from: date).uppercased()
    }()
    
    private enum CodingKeys: String, CodingKey {
        case time
        case temperature
        case icon
        case windSpeed
        case humidity
        case pressure
        case cloudCover
        case uvIndex
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(time, forKey: .time)
        try container.encode(temperature, forKey: .temperature)
        try container.encode(icon, forKey: .icon)
        try container.encode(windSpeed, forKey: .windSpeed)
        try container.encode(humidity, forKey: .humidity)
        try container.encode(pressure, forKey: .pressure)
        try container.encode(cloudCover, forKey: .cloudCover)
        try container.encode(uvIndex, forKey: .uvIndex)
    }
}
