//
//  SignUpViewController.swift
//  LoginApp
//
//  Created by Safeen on 2/10/19.
//  Copyright © 2019 Safeen. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    @IBOutlet weak var ConfirmPasswordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func SignUpAction(_ sender: Any) {
        let Email = EmailTF.text
        let Password = PasswordTF.text
        let ConfirmPassword = ConfirmPasswordTF.text
        
        // Check for empty fields.
        if(Email!.isEmpty || Password!.isEmpty || ConfirmPassword!.isEmpty)
        {
        // Display Alert message
            alertMessage("All fields are required.")
            return
        }
        
        // Check if passwords match
        
        if(Password != ConfirmPassword)
        {
            // Display Alert message
            alertMessage("Password doesn't match.")
            return
        }
        
        // Store Data
        UserDefaults.standard.set(Email, forKey: "Email")
        UserDefaults.standard.set(Password, forKey: "Password")
        
        let alert = UIAlertController(title: "Alert", message: "Registration is successfull!", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){ action in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func dismissPage(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    func alertMessage(_ message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }

}
