//
//  ForecastTableViewController.swift
//  WeatherApp
//
//  Created by Kevin FORTES on 04/12/2019.
//  Copyright © 2019 Kevin FORTES. All rights reserved.
//

import UIKit

class ForecastTableViewController: KFViewController, UITableViewDataSource {
    
    // MARK: --attributes
    
    var forecasts: [Weather]?
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: --methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    
    // MARK: --extension UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "forecast", for: indexPath) as? ForecastTableViewCell,
            var forecast = forecasts?[indexPath.row] else {
            return UITableViewCell()
        }
        let defaultValue = "-"
        cell.dateLabel.text = forecast.dateString
        cell.iconImageView.image = UIImage(named: forecast.iconName)
        var tempValue = defaultValue
        if let temp = forecast.temperature {
            tempValue = "\(temp) °C"
        }
        cell.tempLabel.text = tempValue
        var windSpeedValue = defaultValue
        if let windSpeed = forecast.windSpeed {
            windSpeedValue = "\(windSpeed) km/h"
        }
        cell.windSpeedLabel.text = "Vitesse du vent: \(windSpeedValue)"
        var pressureValue = defaultValue
        if let pressure = forecast.pressure {
            pressureValue = "\(pressure) milibar"
        }
        cell.pressureLabel.text = "Pression: \(pressureValue)"
        var humidityValue = defaultValue
        if let humidity = forecast.humidity {
            humidityValue = "\(humidity)"
        }
        cell.humidityLabel.text = "Humidité: \(humidityValue)"
        var uvValue = defaultValue
        if let uv = forecast.uvIndex {
            uvValue = "\(uv)/12"
        }
        cell.uvLabel.text = "UV: \(uvValue)"
        var visibilityValue = defaultValue
        if let visibility = forecast.cloudCover {
            visibilityValue = "\(visibility)%"
        }
        cell.visibilityLabel.text = "Visibilité: \(visibilityValue)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let forecasts = self.forecasts else {
            return 0
        }
        return forecasts.count
    }
    
}
