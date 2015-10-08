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


- (void) make_All_Recipe_list: (NSString *) token
                      success:(void (^)(NSMutableArray *response))success
                      failure:(void (^)(NSError *error))failure;

- (void) make_Recc_Recipe_list: (NSString *) token
                       success:(void (^)(NSMutableArray *response))success
                       failure:(void (^)(NSError *error))failure;

- (void) make_Subc_Recipe_list: (NSString *) token
                       success:(void (^)(NSMutableArray *response))success
                       failure:(void (^)(NSError *error))failure;

- (void) make_norm_Recipe_list: (NSString *) token
                      recipeId: (int32_t) r_id
                       success:(void (^)(NSMutableArray *response))success
                       failure:(void (^)(NSError *error))failure;


@end
