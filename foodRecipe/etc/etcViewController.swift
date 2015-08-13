//
//  etcViewController.swift
//  foodRecipe
//
//  Created by zilla on 2015. 7. 11..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

import UIKit
import AFNetworking

class etcViewController: UITableViewController {
    
    @IBOutlet var label_version: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var ver:String? = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String
        var build:String? = NSBundle.mainBundle().infoDictionary?["CFBundleVersion"] as? String
        if ver != nil && build != nil {
            self.label_version.text = ver! + "(" + build! + ")"
        }
    }
    
    //MARK:- TableView Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell:UITableViewCell? = tableView.cellForRowAtIndexPath(indexPath)
        cell?.setSelected(false, animated: true)
    }
}
