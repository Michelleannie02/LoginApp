//
//  MainViewController.swift
//  LoginApp
//
//  Created by Safeen on 2/10/19.
//  Copyright © 2019 Safeen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if(!isUserLoggedIn)
        {
        self.performSegue(withIdentifier: "LoginView", sender: self)
        }
        
    }
    @IBAction func Logout(_ sender: Any) {
        self.performSegue(withIdentifier: "LoginView", sender: self)
    }
    
}
