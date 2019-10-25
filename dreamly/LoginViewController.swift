//
//  LoginViewController.swift
//  dreamly
//
//  Created by Gonzalo Birrueta on 10/16/19.
//  Copyright © 2019 Gonzalo Birrueta. All rights reserved.
//

// MARK: - Libraries
import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {

    // MARK: - Vars/IBOutlets
    
    var uid: String = ""
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var errorMessagePasswordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // MARK: - IBActions
    @IBAction func registerPressed(_ sender: UIButton) {
            if emailTextField.text != nil && passwordTextField.text != nil{
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
                    if error != nil{
                        print("Error!:( + " + error!.localizedDescription)
                        self.errorMessageLabel.text = (error!.localizedDescription)
                        self.errorMessageLabel.isHidden = false
                        sender.shake()
                    }
                    else{
                        self.uid = (result?.user.uid)!
                        let ref = Database.database().reference(withPath: "users").child(self.uid)
                        ref.setValue(["email":self.emailTextField.text!, "password":self.passwordTextField.text!])
                        self.errorMessageLabel.isHidden = true
                    }
                }
            }
            
        }

    
    @IBAction func loginPressed(_ sender: UIButton) {
        if emailTextField.text != nil && passwordTextField.text != nil{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
                if error != nil{
                    print("Error!:(" + error!.localizedDescription)
                    self.errorMessagePasswordLabel.text = (error!.localizedDescription)
                    self.errorMessagePasswordLabel.isHidden = false
                    sender.shake()
                }
                else{
                    self.uid = (result?.user.uid)!
                    self.errorMessagePasswordLabel.isHidden = true
                }
            }
        }
    }
    
}
