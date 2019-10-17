//
//  UserProfile.swift
//  dreamly
//
//  Created by Gonzalo Birrueta on 10/17/19.
//  Copyright © 2019 Gonzalo Birrueta. All rights reserved.
//

import Foundation

class UserProfile{
    var uid:String
    var email:String
    
    init(uid: String, email: String){
        self.uid = uid
        self.email = email
    }
}
