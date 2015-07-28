//
//  singleton.swift
//  foodRecipe
//
//  Created by zilla on 2015. 7. 16..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

import Foundation

class FRSingleton {
    static let sharedInstance = FRSingleton()
    
    // login token
    private var token:String?
    
    
    // initialize
    init() {
        self.token = nil;
    }
    
    
    /* 
    *   Token
    */
    func setToken(token pToken:String) {
        self.token = pToken
    }
    
    func getToken() -> String {
        return self.token!
    }
    
    func hasToken() -> Bool {
        return self.token == nil ? false : true
    }
    
    
}