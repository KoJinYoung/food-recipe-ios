//
//  recipeListTableViewCell_horizontal.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 13..
//  Copyright (c) 2015년 Jin-young Ko. All rights reserved.
//

#import "recipeListCells.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation recipeListSize

+ (CGFloat) heightForRecommend
{
    return 410.f;
}

+ (UIEdgeInsets) insetForRecommend
{
    return UIEdgeInsetsMake(0, 20, 0, 20);
}

+ (CGSize) sizeForRecommendCell
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width-54.f, 410.f);
}

+ (CGFloat) minimumInteritemSpacingForRecommend
{
    return 20.f;
}

+ (CGFloat) minimumLineSpacingForRecommend
{
    return 20.f;
}


+ (CGFloat) heightForSubscribe
{
    return 410.f;
}

+ (UIEdgeInsets) insetForSubscribe
{
    return UIEdgeInsetsMake(0, 20, 0, 20);
}

+ (CGSize) sizeForSubscribeCell
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width-54.f, 410.f);
}

+ (CGFloat) minimumInteritemSpacingForSubscribe
{
    return 20.f;
}

+ (CGFloat) minimumLineSpacingForSubscribe
{
    return 20.f;
}


+ (CGFloat) heightForNormal:(NSInteger)numOfRecipes
{
    CGFloat height = [self sizeForNormalCell].height;
    height *= (numOfRecipes + 1)/2;
    height += ([self minimumLineSpacingForNormal] * (CGFloat)(numOfRecipes-1));
    
    return height;
}

+ (UIEdgeInsets) insetForNormal
{
    return UIEdgeInsetsMake(0, 20, 0, 20);
}

+ (CGSize) sizeForNormalCell
{
    CGFloat side = ([UIScreen mainScreen].bounds.size.width
                    -[self insetForNormal].left
                    -[self insetForNormal].right
                    -[self minimumInteritemSpacingForNormal]) / 2.f;
    return CGSizeMake(side, side);
}

+ (CGFloat) minimumInteritemSpacingForNormal
{
    return 10.f;
}

+ (CGFloat) minimumLineSpacingForNormal
{
    return 10.f;
}


@end

@implementation recipeListTableViewCell_horizontal

@end


@implementation recipeListTableViewCell_vertical

@end

@implementation recipeListCell

- (void)setUserThumbnailWithURL:(NSString *)url {
    [_userThumbnail setImageWithURL:[NSURL URLWithString:url]];
}

- (void)setUserName:(NSString *)name {
    [_userNameLabel setText:name];
}

- (void)setRecipeComment:(NSString *)comment {
    [_recipeCommentLabel setText:comment];
}

- (void)setRecipeDescription:(NSString *)desc {
    [_recipeDescriptionLabel setText:desc];
}

- (void)setRecipeImageWithURL:(NSString *)url {
    [_recipeImageView setImageWithURL:[NSURL URLWithString:url]];
}

- (void)toggleRecipeLiked:(UIButton *)sender {
    
}

@end

@implementation recipeListCell_recommend



@end

@implementation recipeListCell_subscribe



@end