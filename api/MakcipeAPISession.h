//
//  MakcipeAPISession.h
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 11..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MakcipeSVC.h"

@interface MakcipeAPISession : NSObject

@property (nonatomic, strong)   NSString        *userAgentString;
@property (nonatomic, assign)   NSTimeInterval  recipeSvcTimeoutInterval;
@property (nonatomic, assign)   NSTimeInterval  userSvcTimeoutInterval;

@property (nonatomic, readonly) BOOL        isAuthenticated;
@property (nonatomic, assign)   BOOL        isAuthExpired;
@property (nonatomic, readonly) NSString    *authenticationToken;

@property (nonatomic, readonly) dispatch_queue_t queue;

@property (nonatomic, strong) NSArray *Servers;

+ (void)setSharedSessionUserAgent:(NSString *)userAgent;
+ (MakcipeAPISession*)sharedSession;


/* create a new client */
- (makcipeAPIRecipeAPIClient *)recipeService;
- (makcipeAPIUserAPIClient *)userService;

@end
