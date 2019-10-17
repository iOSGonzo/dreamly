//
//  AddDreamViewController.swift
//  dreamly
//
//  Created by Gonzalo Birrueta on 10/16/19.
//  Copyright © 2019 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import NotificationCenter


class AddDreamViewController: UIViewController{
    

    @IBOutlet weak var dreamTextField: UITextField!
    @IBOutlet weak var dreamTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    //dismiss keyboard on tapped outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func saveDream(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
