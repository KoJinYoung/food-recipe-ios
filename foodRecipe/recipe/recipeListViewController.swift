//
//  recipeList.swift
//  foodRecipe
//
//  Created by zilla on 2015. 7. 10..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

import UIKit

class recipeListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate {

    
/* for test */
    let testImageURL = ["http://pds21.egloos.com/pds/201206/03/15/d0013015_4fca36c2b2529.jpg",
        "http://pds23.egloos.com/pds/201206/03/15/d0013015_4fca36c8791af.jpg",
        "http://pds24.egloos.com/pds/201206/03/15/d0013015_4fca36cf50ed3.jpg",
        "http://pds21.egloos.com/pds/201206/03/15/d0013015_4fca36d64248c.jpg"];
    
    
    @IBOutlet var listView: UITableView?
    
    var recipeArray: NSMutableArray?
    
    enum listType:Int {
        case recommend
        case subscribe
        case list
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let horizontalNib = UINib(nibName: "recipeListTableViewCell_horizontal", bundle: nil)
        let verticalNib = UINib(nibName: "recipeListTableViewCell_vertical", bundle: nil)
        self.listView?.registerNib(horizontalNib, forCellReuseIdentifier: "recipeListTableViewCell_horizontal")
        self.listView?.registerNib(verticalNib, forCellReuseIdentifier: "recipeListTableViewCell_vertical")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK:- table view datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return self.listView!.frame.size.width
        }
        else if indexPath.section == 1 {
            return self.listView!.frame.size.width
        }
        else if indexPath.section == 2 {
            return ((self.listView!.frame.size.width-10-5)/2.0) * (CGFloat)((Int)(testImageURL.count/2)) + 20
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let nib = UINib(nibName: "recipeListCell", bundle: nil)
        
        var cell: UITableViewCell?
        
        if indexPath.section == 0 {
            let cell_:recipeListTableViewCell_horizontal? = tableView.dequeueReusableCellWithIdentifier("recipeListTableViewCell_horizontal") as? recipeListTableViewCell_horizontal
            cell_?.listView.tag = listType.recommend.rawValue
            cell_?.listView.dataSource = self
            cell_?.listView.delegate = self
            cell_?.listView.registerNib(nib, forCellWithReuseIdentifier: "recipeListCell")
            
            cell = cell_!
        }
        else if indexPath.section == 1 {
            let cell_:recipeListTableViewCell_horizontal? = tableView.dequeueReusableCellWithIdentifier("recipeListTableViewCell_horizontal") as? recipeListTableViewCell_horizontal
            cell_?.listView.tag = listType.subscribe.rawValue
            cell_?.listView.dataSource = self
            cell_?.listView.delegate = self
            cell_?.listView.registerNib(nib, forCellWithReuseIdentifier: "recipeListCell")
            
            cell = cell_!
        }
        else if indexPath.section == 2 {
            let cell_:recipeListTableViewCell_vertical? = tableView.dequeueReusableCellWithIdentifier("recipeListTableViewCell_vertical") as? recipeListTableViewCell_vertical
            cell_?.listView.tag = listType.list.rawValue
            cell_?.listView.dataSource = self
            cell_?.listView.delegate = self
            cell_?.listView.scrollEnabled = false
            cell_?.listView.registerNib(nib, forCellWithReuseIdentifier: "recipeListCell")
            
            cell = cell_!
        }
        
        return cell!
    }

    
    // MARK:- collection view datasource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
//    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//
//        let headerView: recipeListHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "recipeListHeaderView", forIndexPath: indexPath) as! recipeListHeaderView
//        
//        let title = "Recipe Group #" + String(indexPath.section+1)
//        headerView.titleLabel.text = title
//        
//        return headerView as UICollectionReusableView
//    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let tempRecipeArray = self.recipeArray {
            return tempRecipeArray.count
        }
        
        return self.testImageURL.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if collectionView.tag == listType.recommend.rawValue {
            return CGSize(width: (self.listView!.frame.size.width-10), height: (self.listView!.frame.size.width-10))
        }
        else if collectionView.tag == listType.subscribe.rawValue {
            return CGSize(width: (self.listView!.frame.size.width-10), height: (self.listView!.frame.size.width-10))
        }
        else if collectionView.tag == listType.list.rawValue {
            return CGSize(width: (self.listView!.frame.size.width-10-5)/2.0, height: (self.listView!.frame.size.width-10-5)/2.0)
        }
        
        return CGSizeZero
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : recipeListCell = collectionView.dequeueReusableCellWithReuseIdentifier("recipeListCell", forIndexPath: indexPath) as! recipeListCell
        
//        cell.foodImageView. = UIColor.blackColor()
        cell.plainShadow()
        cell.setFoodImageWithURL(self.testImageURL[indexPath.row])
        
        return cell
    }
    
    // MARK: collection view delegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("showDetailRecipe", sender: nil)
    }
    
    
    // MARK:-
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue == "showDetailRecipe" {
            
        }
    }
    
}