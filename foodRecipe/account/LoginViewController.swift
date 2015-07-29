//
//  loginViewController.swift
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 7. 29..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class loginViewController: UIViewController {


    @IBOutlet var btn_login_facebook: UIButton!
    @IBOutlet var btn_login_kakao: UIButton!
    @IBOutlet var btn_login_naver: UIButton!
    @IBOutlet var btn_login_email: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // facebook
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            self.btn_login_facebook.setTitle("Facebook Logout", forState: UIControlState.Normal)
        }
        else {
            self.btn_login_facebook.setTitle("Facebook Login", forState: UIControlState.Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
// MARK: Facebook
    @IBAction func login_facebook(sender: AnyObject) {
        
        var fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            fbLoginManager.logOut()
            self.btn_login_facebook.setTitle("Facebook Login", forState: UIControlState.Normal)
        }
        else {
            fbLoginManager.logInWithReadPermissions(["email"], handler: { (result, error) -> Void in
                if (error == nil){
                    var fbloginresult : FBSDKLoginManagerLoginResult = result
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.btn_login_facebook.setTitle("Facebook Logout", forState: UIControlState.Normal)
                        self.getFBUserData()
                    }
                }
                else {
                    println("error")
                }
            })
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.currentAccessToken()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil){
                    println(result)
                }
            })
        }
    }
    
// MARK: Kakao
    
// MARK: Naver
    
// MARK: Email
    
}