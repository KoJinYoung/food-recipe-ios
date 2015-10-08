//
//  recipeListTableViewCell_horizontal.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 13..
//  Copyright (c) 2015년 Jin-young Ko. All rights reserved.
//

#import "recipeListCells.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "UIView+position.h"

#define headerHeight    61.f

@implementation recipeListSize

+ (CGFloat) heightForRecommend
{
    return 410.f + headerHeight;
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
    return 410.f + headerHeight;;
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
    
    return height + headerHeight;;
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

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if (self.userThumbnail) {
        [self.userThumbnail.layer setCornerRadius:self.userThumbnail.frame.size.width/2.f];
    }
}

- (void)setUserThumbnailWithURL:(NSString *)url {
    [_userThumbnail setImageWithURL:[NSURL URLWithString:url]];
}

- (void)setUserName:(NSString *)name {
    [_userNameLabel setText:name];
}

- (void)setRecipeComment:(NSString *)comment {
    [_recipeCommentLabel setText:comment];
}

- (void)setRecipeImageWithURL:(NSString *)url {
    
    [_loadingIndicator startAnimating];
    
    __weak typeof(_recipeImageView) weakImageView = _recipeImageView;
    __weak typeof(_loadingIndicator) weakLoadingIndicator = _loadingIndicator;
    [_recipeImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [weakLoadingIndicator stopAnimating];
        
        if (image) {
            [weakImageView setImage:image];
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        [weakLoadingIndicator stopAnimating];
    }];
}

- (void)toggleRecipeLiked:(UIButton *)sender {
    
}

@end

@implementation recipeListCell_recommend

@end

@implementation recipeListCell_subscribe


@end