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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var pagerVC: PageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cities = UserData.shared.cities
        checkCities()
        
        // Navigation Controller
        title = "Météo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentMapVC))
        
        // Segmented control
        segmentedControl.setTitle("Aujourd'hui", forSegmentAt: 0)
        segmentedControl.setTitle("Prévision", forSegmentAt: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Take the last city
        if let city = UserData.shared.cities.last {
            title = city.name
            WeatherService.shared.getForecasts(for: city.latitude, and: city.longitude) { (result, gotError) in
                if gotError {
                    BasicAppleFunction.displaySimpleAlertController(title: "Impossible de récupérer les données", message: nil, vc: self, handler: nil)
                    self.pagerVC?.weathers = UserData.shared.weathers
                } else if let weathers = result {
                    UserData.shared.set(weathers: weathers)
                    self.pagerVC?.weathers = weathers
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pager",
            let pagerVC = segue.destination as? PageViewController {
            self.pagerVC = pagerVC
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

