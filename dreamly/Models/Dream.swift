//
//  dream.swift
//  dreamly
//
//  Created by Gonzalo Birrueta on 10/16/19.
//  Copyright © 2019 Gonzalo Birrueta. All rights reserved.
//

import Foundation

class Dream{
    var dreamName:String
    var date:String
    var rating:Double
    
    init(dreamName: String, date: String, rating:Double){
        self.dreamName = dreamName
        self.date = date
        self.rating = rating
    }
}
