//
//  DreamTableViewCell.swift
//  dreamly
//
//  Created by Gonzalo Birrueta on 10/16/19.
//  Copyright © 2019 Gonzalo Birrueta. All rights reserved.
//

import UIKit
import Cosmos

class DreamTableViewCell: UITableViewCell {

    @IBOutlet weak var dreamNameLabel: UILabel!
    @IBOutlet weak var dreamDateLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(dream: Dream){
        dreamNameLabel.text = dream.dreamName
        dreamDateLabel.text = dream.date
        ratingView.rating = dream.rating
    }
    
}
