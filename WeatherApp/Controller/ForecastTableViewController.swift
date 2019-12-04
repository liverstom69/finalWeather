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
        
    }
    
    
    // MARK: --extension UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let forecasts = self.forecasts else {
            return 0
        }
        return forecasts.count
    }
    
}
