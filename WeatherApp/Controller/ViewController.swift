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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cities = UserData.shared.cities
        checkCities()
        title = "Météo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentMapVC))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Take the last city
        if let city = UserData.shared.cities.last {
            WeatherService.shared.getForecasts(for: city.latitude, and: city.longitude) { (weather, gotError) in
                if gotError {
                    let _ = weather
                } else {
                    let _ = weather
                }
            }
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

