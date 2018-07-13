//
//  SignUpGuideVC.swift
//  GuiderApp
//
//  Created by Raphaelle Baptiste on 7/10/18.
//  Copyright © 2018. All rights reserved.
//
import UIKit
import Firebase


class SignUpGuideVC:UIViewController {

    @IBOutlet weak var FullNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordConfirmationTF: UITextField!
    
    @IBAction func GetStartedButton(_ sender: Any)
    {
        
        guard let name = FullNameTF.text,
            name != "",
            let email = emailTF.text,
            email != "",
            let password = passwordTF.text,
            password != ""
                else
        {
                    AlertController.showAlert(inViewController: self, title:"ERROR", message: "Please fill out all fields")
                    return
            
        }
        
        firebase.auth().createUser(withEmail: email, password: password, completion: {(user, error) in
            
            guard error == nil else
            {
                AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            print(user.email ?? "MISSING EMAIL")
            print(user.uid)
            
            let changeRequest = user.UserprofileChangeRequest()
            changeRequest().displayName = name
            changeRequest().commitChanges(completion: {(error) in
                
            guard error == nil else
            {
                AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
                return
            }
            //self.performSegue(withIdentifier: "GetStarted", sender: nil)
            
        })
    })
}
}
