//
//  ViewController.swift
//  WeatherApp
//
//  Created by Kevin FORTES on 03/12/2019.
//  Copyright © 2019 Kevin FORTES. All rights reserved.
//

import UIKit

class ViewController: KFViewController {

    var cities: [Location]!
    var forecastVC: ForecastTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cities = UserData.shared.cities
        checkCities()
        
        // Navigation Controller
        title = "Météo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentMapVC))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Take the last city
        if let city = UserData.shared.cities.last {
            title = city.name
            WeatherService.shared.getForecasts(for: city.latitude, and: city.longitude) { (result, gotError) in
                if gotError {
                    BasicAppleFunction.displaySimpleAlertController(title: "Impossible de récupérer les données", message: nil, vc: self, handler: nil)
                    self.forecastVC?.forecasts = UserData.shared.weathers
                } else if let weathers = result {
                    UserData.shared.set(weathers: weathers)
                    self.forecastVC?.forecasts = weathers
                }
                self.forecastVC?.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forecast",
            let forecastVC = segue.destination as? ForecastTableViewController {
            self.forecastVC = forecastVC
        }
    }
    
    @objc func presentMapVC() {
        if let mapVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "map") as? MapViewController {
            mapVC.modalPresentationStyle = .fullScreen
            present(mapVC, animated: true, completion: nil)
        }
    }
    
    func checkCities() {
        if cities.count == 0 {
            presentMapVC()
        }
    }

}

