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
    
    func getForecasts(for latitude: CLLocationDegrees, and longitude: CLLocationDegrees, completion: @escaping (_ response: Any?, _ isError: Bool) -> Void) {
        let url = "https://api.darksky.net/forecast/\(key)/\(latitude),\(longitude)?exclude=[currently,minutly,hourly,alerts,flags]"
        let manager = AFHTTPSessionManager()
        // If we have multiple calls. I would create a class which would manage API calls
        manager.get(url, parameters: nil, progress: nil, success: { (task, responseObject) in
            DispatchQueue.main.async {
                completion(responseObject, false)
            }
        }) { (task, error) in
            DispatchQueue.main.async {
                completion(nil, true)
            }
        }
        
    }
    
}
