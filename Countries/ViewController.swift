//
//  ViewController.swift
//  Countries
//
//  Created by Mohamed Eshawy on 10/15/18.
//  Copyright © 2018 SoleekLab. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func LoginPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) {
            (user,error) in
            if error != nil {
                self.errorLabel.text = error?.localizedDescription
                return
            }
            self.errorLabel.text = ""
            if let email = user?.email {
                print(email)
                print("Login is done Successful!")
                self.performSegue(withIdentifier: "toCountriesList", sender: self)
            }
        }
    }
    
}

