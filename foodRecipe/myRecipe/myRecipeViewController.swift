//
//  myRecipeViewController.swift
//  foodRecipe
//
//  Created by zilla on 2015. 7. 11..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

import UIKit

class myRecipeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(accountManager.hasToken()) {
            
        }
        else {
            self.openLoginPage()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
    }
    
    func openLoginPage() {
        let vc:UINavigationController = myStoryboard().instantiateViewControllerWithIdentifier("loginNavigationController") as! UINavigationController
        self.presentViewController(vc, animated: true, completion: nil)
    }
}
