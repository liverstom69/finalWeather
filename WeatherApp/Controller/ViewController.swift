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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let _ = UserData.shared.cities
    }
    
    func presentMapVC() {
        if let mapVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "map") as? MapViewController {
            mapVC.modalPresentationStyle = .fullScreen
            present(mapVC, animated: true, completion: nil)
        }
    }
    
    func checkCities() {
        if cities.count > 0 {
            
        } else {
            presentMapVC()
        }
    }


}

