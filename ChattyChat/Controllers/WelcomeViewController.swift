//
//  WelcomeViewController.swift
//  ChattyChat
//
//  Created by Андрей Останин on 15.08.2020.
//  Copyright © 2020 Андрей Останин. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = Constants.appName
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        navigationController?.isNavigationBarHidden = false
    }

}
