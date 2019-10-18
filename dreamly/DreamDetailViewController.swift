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


class DreamDetailViewController: UIViewController {
    
    var notesDetail = ""
    var dateDetail = ""
    var starsDetail = 0.0
    var titleDetail = ""
    
    @IBOutlet weak var dreamTitleDetail: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        dreamTitleDetail.text = titleDetail
    }
    
    
}
