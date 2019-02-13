//
//  SignUpViewController.swift
//  LoginApp
//
//  Created by Safeen on 2/10/19.
//  Copyright © 2019 Safeen. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var UsernameTF: UITextField!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    @IBOutlet weak var ConfirmPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Global Variables.
    struct GlobalVariable {
        static var username = String()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        removePartialCurlTap()
    }
    

    @IBAction func SignUpAction(_ sender: Any) {
        
        GlobalVariable.username = UsernameTF.text!
        let Email = EmailTF.text
        let Password = PasswordTF.text
        let ConfirmPassword = ConfirmPasswordTF.text
        
        // Check for empty fields.
        if(GlobalVariable.username.isEmpty || Email!.isEmpty || Password!.isEmpty || ConfirmPassword!.isEmpty)
        {
        // Display Alert message
            alertMessage("Alert", "All fields are required.")
            return
        }
        
        // Check if passwords match
        
        if(Password != ConfirmPassword)
        {
            // Display Alert message
            alertMessage("Alert", "Password doesn't match.")
            return
        }
        
        Auth.auth().createUser(withEmail: Email!, password: Password!){ (user, error) in
            if error == nil {
                self.performSegue(withIdentifier: "signupToMain", sender: self)
            }
            else{
                self.alertMessage("Error", error!.localizedDescription)
            }
        }
    }
    
    @IBAction func dismissPage(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
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
