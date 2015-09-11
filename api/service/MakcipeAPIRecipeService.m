//
//  MakcipeAPIRecipeService.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 11..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

#import "MakcipeAPIRecipeService.h"

@implementation MakcipeAPIRecipeService

+ (MakcipeAPIRecipeService *)recipeService
{
    MakcipeAPIRecipeService *recipeService = [[MakcipeAPIRecipeService alloc] initWithSession:[MakcipeAPISession sharedSession]];
    return recipeService;
}

- (instancetype)init
{
    self = [super initWithSession:[MakcipeAPISession sharedSession]];
    if (self) {
        
    }
    
    return self;
    
}

- (id)initWithSession:(MakcipeAPISession *)session
{
    self = [super initWithSession:session];
    if (self) {
        
    }
    return self;
}

- (void)getAll:(NSString *)table success:(void (^)(NSString *))success failure:(void (^)(NSError *))failure
{
    [self invokeAsyncIdBlock:^id{
        return [self.recipeAPIClient getAll:table];
    } success:success failure:failure];
}

@end
