//
//  ProfileViewController.swift
//  dreamly
//
//  Created by Gonzalo Birrueta on 10/16/19.
//  Copyright © 2019 Gonzalo Birrueta. All rights reserved.
//
// MARK: - Libaries
import UIKit
import FirebaseDatabase
import FirebaseAuth


class ProfileViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!


    
    override func viewDidLoad() {
        let userEmail = Auth.auth().currentUser?.email

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailLabel.text = "Email: " + userEmail!
    }

    
    // MARK: - IBActions

    @IBAction func logoutBtnPressed(_ sender: UIButton) {
        try! Auth.auth().signOut()
    }
    

}
