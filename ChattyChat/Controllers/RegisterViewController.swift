//
//  RegisterViewController.swift
//  ChattyChat
//
//  Created by Андрей Останин on 15.08.2020.
//  Copyright © 2020 Андрей Останин. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .systemYellow
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
                if error != nil {
                    print(error!)
                } else {
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        }
    }
    
    
}
