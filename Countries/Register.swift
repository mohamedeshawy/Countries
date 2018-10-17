//
//  Register.swift
//  Countries
//
//  Created by Mohamed Eshawy on 10/15/18.
//  Copyright © 2018 SoleekLab. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import FirebaseAuth

class Register: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var ConfirmPasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func RegisterPressed(_ sender: Any) {
        if passwordTextField.text != ConfirmPasswordTextField.text {
            self.errorLabel.text = "Password is not matched"
            return
        }
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) {
            (authResult , error) in
            if error != nil {
                self.errorLabel.text = error?.localizedDescription
                return
            }
            self.errorLabel.text = ""
            if let user = authResult {
                print("Register is done Successful!")
                print(user.email!)
                self.performSegue(withIdentifier: "toCountriesList", sender: self)
            }
        }
    }
}
