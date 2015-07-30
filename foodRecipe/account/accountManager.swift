//
//  accountManager.swift
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 7. 29..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

import Foundation
import KeychainAccess

class accountManager {
    
    static func myKeyChain() -> Keychain {
        return Keychain(service: "foodRecipe", accessGroup: "com.MakSSe")
    }
    
    static func getToken() -> String? {
        return myKeyChain().get("token")
    }
    
    static func setToken(token:String) {
        myKeyChain().set(token, key: "token")
    }
    
    static func hasToken() -> Bool {
        return getToken() == nil ? false : true
    }
}