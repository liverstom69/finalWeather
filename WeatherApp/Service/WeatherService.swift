//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Kevin FORTES on 03/12/2019.
//  Copyright © 2019 Kevin FORTES. All rights reserved.
//

import Foundation
import CoreLocation
import AFNetworking

class WeatherService {
    
    static let shared = WeatherService()
    
    // Not inside code in regular times 
    private let key = "8549198e6dbb1e86311d76dd899ad0e0"
    
    private init() {}
    
    func getForecasts(for latitude: CLLocationDegrees, and longitude: CLLocationDegrees, completion: @escaping (_ response: [Weather]?, _ isError: Bool) -> Void) {
        let url = "https://api.darksky.net/forecast/\(key)/\(latitude),\(longitude)?exclude=[currently,minutly,hourly,alerts,flags]"
        let manager = AFHTTPSessionManager()
        // If we have multiple calls. I would create a class which would manage API calls
        manager.get(url, parameters: nil, progress: nil, success: { (task, responseObject) in
            var weathers = [Weather]()
            if let dict = responseObject as? [String: Any],
                let dailyDict = dict["daily"] as? [String: Any] {
                var arrayOfData: [[String: Any]]?
                if let data = dailyDict["data"] as? [String: Any] {
                    arrayOfData = [data]
                } else if let data = dailyDict["data"] as? [[String: Any]] {
                    arrayOfData = data
                }
                if let arrayOfData = arrayOfData,
                    let jsonResult = try? JSONSerialization.data(withJSONObject: arrayOfData, options: .prettyPrinted),
                    let resultWeather = try? JSONDecoder().decode([Weather].self, from: jsonResult) {
                    weathers = resultWeather
                }
            }
            DispatchQueue.main.async {
                completion(weathers, false)
            }
        }) { (task, error) in
            DispatchQueue.main.async {
                completion(nil, true)
            }
        }
        
    }
    
}
