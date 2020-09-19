//
//  LoginViewController.swift
//  ChattyChat
//
//  Created by Андрей Останин on 15.08.2020.
//  Copyright © 2020 Андрей Останин. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextfield.attributedPlaceholder = NSAttributedString(string: emailTextfield.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: passwordTextfield.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])

        navigationController?.navigationBar.tintColor = .systemYellow
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if error != nil {
                    print(error!)
                } else {
                    self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
                }
            }
        }
    }
    
}
