//
//  recipeList.swift
//  foodRecipe
//
//  Created by zilla on 2015. 7. 10..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

import UIKit

class recipeListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
/* for test */
    let testImageURL = ["http://pds21.egloos.com/pds/201206/03/15/d0013015_4fca36c2b2529.jpg",
        "http://pds23.egloos.com/pds/201206/03/15/d0013015_4fca36c8791af.jpg",
        "http://pds24.egloos.com/pds/201206/03/15/d0013015_4fca36cf50ed3.jpg",
        "http://pds21.egloos.com/pds/201206/03/15/d0013015_4fca36d64248c.jpg"];
    
    
    @IBOutlet var listView: UICollectionView?
    
    var recipeArray: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let tempRecipeArray = self.recipeArray {
            return tempRecipeArray.count
        }
        
        return self.testImageURL.count
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var size: CGSize = CGSize(width: (self.listView!.frame.size.width-10-5)/2.0, height: (self.listView!.frame.size.width-10-5)/2.0)
        
        return size
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : recipeListCell = collectionView.dequeueReusableCellWithReuseIdentifier("recipeListCell", forIndexPath: indexPath) as! recipeListCell
        
//        cell.foodImageView. = UIColor.blackColor()
        cell.plainShadow()
        cell.setFoodImageWithURL(self.testImageURL[indexPath.row])
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("showDetailRecipe", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue == "showDetailRecipe" {
            
        }
    }
    
}