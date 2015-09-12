//
//  accountManager.h
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 12..
//  Copyright (c) 2015년 Jin-young Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UICKeyChainStore/UICKeyChainStore.h>

@interface accountManager : NSObject

+ (UICKeyChainStore *) myKeyChain;

+ (NSString *) getToken;

+ (void) setToken:(NSString *)token;

+ (BOOL) hasToken;

@end
