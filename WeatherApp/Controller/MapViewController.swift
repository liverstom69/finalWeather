//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Kevin FORTES on 03/12/2019.
//  Copyright © 2019 Kevin FORTES. All rights reserved.
//

import Foundation
import MapKit

class MapViewController: KFViewController {
    
    // MARK: --Attributes
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func select() {
        let city = Location()
        let center = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        CLGeocoder().reverseGeocodeLocation(center) { (placemarks, error) in
            var cityName = ""
            if error == nil,
                let name = placemarks?.first?.locality {
                cityName = name
                city.name = cityName
                city.latitude = self.mapView.centerCoordinate.latitude
                city.longitude = self.mapView.centerCoordinate.longitude
                UserData.shared.add(city: city)
            }
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
