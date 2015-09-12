//
//  accountManager.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 12..
//  Copyright (c) 2015년 Jin-young Ko. All rights reserved.
//

#import "accountManager.h"

@implementation accountManager

+ (UICKeyChainStore *) myKeyChain {
    return [UICKeyChainStore keyChainStoreWithService:@"MakCipe" accessGroup:@"com.MakSSe"];
}

+ (NSString *) getToken {
    return [[self myKeyChain] stringForKey:@"token"];
}

+ (void) setToken:(NSString *)token {
    [[self myKeyChain] setString:token forKey:@"token"];
}

+ (BOOL) hasToken {
    NSError *error;
    [[self myKeyChain] stringForKey:@"token" error:&error];
    if (error) {
        return NO;
    }
    
    return YES;
}

@end
