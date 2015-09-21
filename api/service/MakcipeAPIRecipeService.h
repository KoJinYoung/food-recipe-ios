//
//  MakcipeAPIRecipeService.h
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 11..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

#import "MakcipeAPI.h"

@interface MakcipeAPIRecipeService : MakcipeAPI

+ (MakcipeAPIRecipeService *)recipeService;
- (id)initWithSession:(MakcipeAPISession *)session;

- (void) getAll: (NSString *) table
        success:(void (^)(NSString *response))success
        failure:(void (^)(NSError *error))failure;



@end
