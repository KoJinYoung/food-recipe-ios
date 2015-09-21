//
//  MakcipeAPI.h
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 11..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MakcipeSVC.h"
#import "MakcipeAPISession.h"

@interface MakcipeAPI : NSObject

@property (nonatomic, strong) MakcipeAPISession *                session;
@property (nonatomic, readonly) makcipeAPIRecipeAPIClient * recipeAPIClient;
@property (nonatomic, readonly) makcipeAPIUserAPIClient * userAPIClient;

- (id)initWithSession:(MakcipeAPISession *)session;

// Make an NSError from a given NSException.
- (NSError *)errorFromNSException:(NSException *)exception;

// asynchronously invoke the given blocks,
// calling back to success/failure on the main threa.
- (void)invokeAsyncBoolBlock:(BOOL(^)())block
                     success:(void(^)(BOOL val))success
                     failure:(void(^)(NSError *error))failure;

- (void)invokeAsyncIdBlock:(id(^)())block
                   success:(void(^)(id))success
                   failure:(void(^)(NSError *error))failure;

- (void)invokeAsyncInt32Block:(int32_t(^)())block
                      success:(void(^)(int32_t val))success
                      failure:(void(^)(NSError *error))failure;

- (void)invokeAsyncVoidBlock:(void(^)())block
                     success:(void(^)())success
                     failure:(void(^)(NSError *error))failure;

@end
