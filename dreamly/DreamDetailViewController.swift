//
//  DreamDetailViewController.swift
//  dreamly
//
//  Created by Gonzalo Birrueta on 10/18/19.
//  Copyright © 2019 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import Cosmos

class DreamDetailViewController: UIViewController {
    
    
    var userID: String?
    var keyArray:[String] = []

    var notesDetail = ""
    var dateDetail = ""
    var starsDetail = 0.0
    var titleDetail = ""
    var index = 0
    
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var dreamNotesDetail: UILabel!
    @IBOutlet weak var dreamTitleDetail: UILabel!
    @IBOutlet weak var dreamDateDetail: UILabel!
    @IBOutlet weak var dreamStarsDetail: CosmosView!
    
    @IBOutlet weak var editDreamNotes: UITextField!
    @IBOutlet weak var editDreamName: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        dreamTitleDetail.text = titleDetail
        dreamNotesDetail.text = notesDetail
        dreamDateDetail.text = dateDetail
        dreamStarsDetail.rating = starsDetail
        
        editDreamNotes.isHidden = true
        editDreamName.isHidden = true
        saveBtn.isHidden = true
    }
    
    @IBAction func editClicked(_ sender: Any) {
        dreamTitleDetail.isHidden = true
        dreamNotesDetail.isHidden = true
        dreamStarsDetail.settings.updateOnTouch = true
        dreamStarsDetail.rating = 0.0
        editBtn.isHidden = true
        editDreamNotes.isHidden = false
        editDreamName.isHidden = false
        saveBtn.isHidden = false

    }
    
    // MARK: - Backend on Save Pressed

    @IBAction func savePressed(_ sender: Any) {
        
            
        let userID = Auth.auth().currentUser?.uid

        getAllKeys()

        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when, execute: {
            let ref = Database.database().reference(withPath: "users").child(userID!).child("dreams").child(self.keyArray[self.index])

            let dream = ["title":self.editDreamName.text!,
                        "notes":self.editDreamNotes.text!,
                        "rating":self.dreamStarsDetail.rating,
                        "date":self.getCurrentDate()] as [String : Any]
                
            ref.setValue(dream)
            
            self.keyArray = []
        })
        
        dismiss(animated: true, completion: nil)
            
    }
    
    
    func getAllKeys(){
        let userID = Auth.auth().currentUser?.uid

         let dreamRef = Database.database().reference().child("users").child(userID!).child("dreams")
         let queryRef = dreamRef.queryOrdered(byChild: "date")

         queryRef.observeSingleEvent(of: .value, with: { ( snapshot ) in
            for child in snapshot.children{
                
                let snap = child as! DataSnapshot
                let key = snap.key
                self.keyArray.insert(key, at:0)
            }
         })
        
    }
    
    func getCurrentDate() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        let str = formatter.string(from: Date())
        return str
    }
    
    
}
