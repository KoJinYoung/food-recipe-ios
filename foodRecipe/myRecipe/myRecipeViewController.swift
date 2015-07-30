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
            let vc:UIViewController = myStoryboard().instantiateViewControllerWithIdentifier("loginViewController") as! UIViewController
            self.presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
