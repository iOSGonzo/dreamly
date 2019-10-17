//
//  UserService.swift
//  dreamly
//
//  Created by Gonzalo Birrueta on 10/17/19.
//  Copyright © 2019 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import Firebase

class UserService{
    
    static var currentUserProfile:UserProfile?
    
    static func observeUserProfile(_ uid:String, completion: @escaping ((_ userProfile:UserProfile?)->())){
        let userRef = Database.database().reference().child("users/\(uid)")
        
        userRef.observe(.value, with: { snapshot in
            var userProfile:UserProfile?
            
            if let dict = snapshot.value as? [String: Any],
                let email = dict["email"] as? String{
                userProfile = UserProfile(uid: snapshot.key, email: email)
            }
            completion(userProfile)
        })
    }
    
}
