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

- (void) make_All_Recipe_list: (NSString *) token
                      success:(void (^)(NSMutableArray *response))success
                      failure:(void (^)(NSError *error))failure
{
    [self invokeAsyncIdBlock:^id{
        return [self.recipeAPIClient make_All_Recipe_list];
    } success:success failure:failure];
}

- (void) make_Recc_Recipe_list: (NSString *) token
                       success:(void (^)(NSMutableArray *response))success
                       failure:(void (^)(NSError *error))failure
{
    [self invokeAsyncIdBlock:^id{
        return [self.recipeAPIClient make_Recc_Recipe_list];
    } success:success failure:failure];
}

- (void) make_Subc_Recipe_list: (NSString *) token
                       success:(void (^)(NSMutableArray *response))success
                       failure:(void (^)(NSError *error))failure
{
    [self invokeAsyncIdBlock:^id{
        return [self.recipeAPIClient make_Subc_Recipe_list];
    } success:success failure:failure];
}

- (void) make_norm_Recipe_list: (NSString *) token
                      recipeId: (int32_t) r_id
                       success:(void (^)(NSMutableArray *response))success
                       failure:(void (^)(NSError *error))failure
{
    [self invokeAsyncIdBlock:^id{
        return [self.recipeAPIClient make_norm_Recipe_list:r_id];
    } success:success failure:failure];
}

@end
