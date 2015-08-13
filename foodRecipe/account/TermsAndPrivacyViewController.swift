//
//  TermsAndPrivacyViewController.swift
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 8. 13..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

import UIKit

class TermsAndPrivacyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func closeViewController(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
