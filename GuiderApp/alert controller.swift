//
//  alert controller.swift
//  GuiderApp
//
//  Created by Raphaelle Baptiste on 7/12/18.
//  Copyright © 2018 Expedia. All rights reserved.
//

import UIKit

class AlertController{
    static func showAlert(inViewController: UIViewController, title: String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
        }
}
