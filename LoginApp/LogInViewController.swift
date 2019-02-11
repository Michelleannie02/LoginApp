//
//  ViewController.swift
//  LoginApp
//
//  Created by Safeen on 2/10/19.
//  Copyright © 2019 Safeen. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        removePartialCurlTap()
    }

    @IBAction func LoginAction(_ sender: Any) {
        let Email = EmailTF.text
        let Password = PasswordTF.text
        
//        let EmailStored = UserDefaults.standard.string(forKey: "Email")
//        let PasswordStored = UserDefaults.standard.string(forKey: "Password")
        
        // Check for empty fields.
        if(Email!.isEmpty || Password!.isEmpty)
        {
            // Display Alert message
            alertMessage("Alert", "All fields are required.")
            return
        }
        
        Auth.auth().signIn(withEmail: Email!, password: Password!) { (user, error) in
            if error == nil{
                self.performSegue(withIdentifier: "loginToMain", sender: self)
                
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()

            }
            else{
                self.alertMessage("Error" ,error!.localizedDescription)
            }
        }
        
        // Check if the Emails match
//        if(EmailStored == Email)
//        {
//            if(PasswordStored == Password)
//            {
//
//                // Login Locally
//                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
//                UserDefaults.standard.synchronize()
//                self.dismiss(animated: true, completion: nil)
//            }else{
//                alertMessage("Password is invalid.")
//            }
//        }else{
//            alertMessage("Email is invalid.")
//        }
        
        }
    func alertMessage(_ title: String, _ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    private func removePartialCurlTap() {
        if let gestures = self.view.gestureRecognizers {
            for gesture in gestures {
                self.view.removeGestureRecognizer(gesture)
            }
        }
    }
}

