//
//  LoginViewController.swift
//  foodRecipe
//
//  Created by zilla on 2015. 7. 21..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet var btn_login_facebook: FBSDKLoginButton!
    @IBOutlet var btn_login_kakao: UIButton!
    @IBOutlet var btn_login_naver: UIButton!
    @IBOutlet var btn_login_email: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // facebook
        self.btn_login_facebook.delegate = self
//        self.btn_login_facebook.
        
        // add Target
        self.btn_login_facebook.addTarget(self, action: Selector("login_facebook"), forControlEvents: UIControlEvents.TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func login_facebook() {
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            
        }
        else {
            
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        println("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
                print(result.token.tokenString)
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
    }
    
}
