//
//  BasicAppleFunction.swift
//  WeatherApp
//
//  Created by Kevin FORTES on 04/12/2019.
//  Copyright © 2019 Kevin FORTES. All rights reserved.
//

import UIKit

class BasicAppleFunction {
    
    public class func displaySimpleAlertController(title: String?,
                                            message: String?,
                                            vc: UIViewController?,
                                            handler: ((UIAlertAction) -> Void)?) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        vc?.present(ac, animated: true, completion: nil)
    }
    
}
