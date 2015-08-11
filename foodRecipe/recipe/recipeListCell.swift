//
//  recipeListCell.swift
//  foodRecipe
//
//  Created by zilla on 2015. 7. 11..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

import UIKit
import AFNetworking

//MARK:-
class recipeListTableViewCell_horizontal : UITableViewCell {
    
    @IBOutlet var listView: UICollectionView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

//MARK:-
class recipeListTableViewCell_vertical : UITableViewCell {
    
    @IBOutlet var listView: UICollectionView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}


//MARK:-
class recipeListCell: UICollectionViewCell {
    
    @IBOutlet var userThumbnail: UIImageView!
    @IBOutlet var foodImageView: UIImageView!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.whiteColor()
    }
    
    func plainShadow() {
        
        var layer = self.layer
        
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 2
        
        layer.cornerRadius = 4
    }
    
    func setFoodImageWithURL(url:String) {
        self.foodImageView.setImageWithURL(NSURL(string: url))
    }
}