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
import Cosmos

class AddDreamViewController: UIViewController{
    

    @IBOutlet weak var dreamTextField: UITextField!
    @IBOutlet weak var dreamTitleTextField: UITextField!
    @IBOutlet weak var editRating: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    //dismiss keyboard on tapped outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func saveDream(_ sender: Any) {
        
    }
    
    
}

extension Date {

   func today(format : String = "dd-MM-yyyy") -> String{
      let date = Date()
      let formatter = DateFormatter()
      formatter.dateFormat = format
      return formatter.string(from: date)
   }
}
