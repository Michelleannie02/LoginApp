//
//  ViewController.swift
//  LoginApp
//
//  Created by Safeen on 2/10/19.
//  Copyright © 2019 Safeen. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func LoginAction(_ sender: Any) {
        let Email = EmailTF.text
        let Password = PasswordTF.text
        
        let EmailStored = UserDefaults.standard.string(forKey: "Email")
        let PasswordStored = UserDefaults.standard.string(forKey: "Password")
        
        // Check for empty fields.
        if(Email!.isEmpty || Password!.isEmpty)
        {
            // Display Alert message
            alertMessage("All fields are required.")
            return
        }
        
        // Check if the Emails match
        if(EmailStored == Email)
        {
            if(PasswordStored == Password)
            {
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                self.dismiss(animated: true, completion: nil)
            }else{
                alertMessage("Password is invalid.")
            }
        }else{
            alertMessage("Email is invalid.")
        }
        
        }
    func alertMessage(_ message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

