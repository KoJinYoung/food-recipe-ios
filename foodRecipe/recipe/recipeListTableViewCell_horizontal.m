//
//  recipeListTableViewCell_horizontal.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 13..
//  Copyright (c) 2015년 Jin-young Ko. All rights reserved.
//

#import "recipeListTableViewCell_horizontal.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

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