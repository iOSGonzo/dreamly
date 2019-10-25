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
    
    var userID: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userID = Auth.auth().currentUser!.uid
    }
    //dismiss keyboard on tapped outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - IBActions

    @IBAction func saveDream(_ sender: Any) {

        let ref = Database.database().reference(withPath: "users").child(userID!)
        
        guard let key = ref.child("dreams").childByAutoId().key else { return }
        let dream = ["title":self.dreamTitleTextField.text!,
                    "notes":self.dreamTextField.text!,
                    "rating":self.editRating.rating,
                    "date":self.getCurrentDate()] as [String : Any]
        let childUpdates = ["/dreams/\(key)": dream]
        ref.updateChildValues(childUpdates)
        
        dismiss(animated: true, completion: nil)
            
        }
    
    func getCurrentDate() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        let str = formatter.string(from: Date())
        return str
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
