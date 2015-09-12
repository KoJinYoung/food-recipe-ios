//
//  recipeListTableViewCell_horizontal.h
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 13..
//  Copyright (c) 2015년 Jin-young Ko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol recipeListDelegate;

#pragma mark -
@interface recipeListTableViewCell_horizontal : UITableViewCell

@property (strong, nonatomic) IBOutlet UICollectionView *listView;

@end

#pragma mark -
@interface recipeListTableViewCell_vertical : UITableViewCell

@property (strong, nonatomic) IBOutlet UICollectionView *listView;

@end

#pragma mark -
@interface recipeListCell : UICollectionViewCell

@property (strong, nonatomic) id delegate;
@property (strong, nonatomic) NSIndexPath* indexPath;

@property (strong, nonatomic) IBOutlet UIImageView*         userThumbnail;
@property (strong, nonatomic) IBOutlet UILabel*             userNameLabel;
@property (strong, nonatomic) IBOutlet UILabel*             recipeCommentLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint*  recipeCommentLabelHeight;
@property (strong, nonatomic) IBOutlet UIImageView*         recipeImageView;
@property (strong, nonatomic) IBOutlet UILabel*             recipeDescriptionLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint*  recipeDescriptionLabelHeight;
@property (strong, nonatomic) IBOutlet UIImageView*         recipeLikeImageView;
@property (strong, nonatomic) IBOutlet UIButton*            recipeLikeButton;

- (void) setUserThumbnailWithURL:(NSString*)url;
- (void) setUserName:(NSString*)name;
- (void) setRecipeComment:(NSString*)comment;
- (void) setRecipeDescription:(NSString*)desc;
- (void) setRecipeImageWithURL:(NSString*)url;

- (IBAction)toggleRecipeLiked:(UIButton*)sender;

@end

#pragma mark -
@protocol recipeListDelegate <NSObject>

@optional
-(void)recipeLike:(NSIndexPath*)indexPath finished:(void(^)(BOOL liked))finished;

@end