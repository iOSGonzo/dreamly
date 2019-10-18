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
    
    var notesDetail = ""
    var dateDetail = ""
    var starsDetail = 0.0
    var titleDetail = ""
    
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
    
}
