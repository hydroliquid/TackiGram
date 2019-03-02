//
//  LoginViewController.swift
//  TackiGram
//
//  Created by Js on 3/1/19.
//  Copyright © 2019 Zlabs. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func OnSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = userNameField.text!
        user.password = passwordField.text!
        
        user.signUpInBackground {
            (succeeded: Bool, error) in
            if succeeded {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription)))")
            }
        }
    }
    
       @IBAction func OnLogIn(_ sender: Any) {
            let username = userNameField.text!
            let password = passwordField.text!
            
            PFUser.logInWithUsername(inBackground: username, password: password){
                (user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "LoginSegue", sender: nil)
                } else {
                    print("Error: \(String(describing: error?.localizedDescription)))")
                }
            }
        
    }

}
