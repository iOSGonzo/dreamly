//
//  LoginViewController.swift
//  dreamly
//
//  Created by Gonzalo Birrueta on 10/16/19.
//  Copyright © 2019 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {

    var uid: String = ""
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if emailTextField.text != nil && passwordTextField.text != nil{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
                if error != nil{
                    print("Error!:(")
                }
                else{
                    self.uid = (result?.user.uid)!
                    let ref = Database.database().reference(withPath: "users").child(self.uid)
                    ref.setValue(["email":self.emailTextField.text!, "password":self.passwordTextField.text!])
                }
            }
        }
        
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        if emailTextField.text != nil && passwordTextField.text != nil{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
                if error != nil{
                    print("Error!:(")
                }
                else{
                    self.performSegue(withIdentifier: "toMain", sender: self)
                    self.uid = (result?.user.uid)!
                }
            }
        }
    }
    
}