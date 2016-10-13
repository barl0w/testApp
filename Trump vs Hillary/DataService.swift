//
//  DataService.swift
//  Trump vs Hillary
//
//  Created by Kiddos on 10/12/16.
//  Copyright © 2016 Team Apps. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

let DB_BASE  = FIRDatabase.database().reference()
let STORAGE_BASE = FIRStorage.storage().reference()

class DataService {
    
    static let ds = DataService()
    
    private var _REF_USERS = DB_BASE.child("users")

    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    var REF_USER_CURRENT: FIRDatabaseReference {
        let uid = KeychainWrapper.stringForKey(KEY_UID)
        let user = REF_USERS.child(uid!)
        return user
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String> ) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}

