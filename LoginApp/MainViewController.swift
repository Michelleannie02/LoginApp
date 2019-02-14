//
//  MainViewController.swift
//  LoginApp
//
//  Created by Safeen on 2/10/19.
//  Copyright © 2019 Safeen. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    @IBOutlet weak var helloDarkness: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let delimeter = "@"
        let newstr = SignUpViewController.GlobalVariable.email
        let token = newstr.components(separatedBy: delimeter).first
        helloDarkness.text = "Hello "+token!+"!"
        
    }
    
    @IBAction func Logout(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        self.performSegue(withIdentifier: "startView", sender: self)
        
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let initial = storyboard.instantiateInitialViewController()
//        UIApplication.shared.keyWindow?.rootViewController = initial
    }
    
}
