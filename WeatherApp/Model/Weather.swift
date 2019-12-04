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
    let windSpeed: Double?
    let humidity: Float?
    let pressure: Double?
    let cloudCover: Float?
    let uvIndex: Int?
    
    private enum CodingKeys: String, CodingKey {
        case time
        case icon
        case windSpeed
        case humidity
        case pressure
        case cloudCover
        case uvIndex
    }
    
    func encode(to encoder: Encoder) throws {}
}
