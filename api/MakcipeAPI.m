//
//  MakcipeAPI.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 11..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

#import "MakcipeAPI.h"
#import "MakcipeSDK.h"
#import <thrift/TTransportException.h>

@implementation MakcipeAPI
@synthesize session = _session;

- (id)initWithSession:(MakcipeAPISession *)session {

    if (self = [super init]) {
        _session = session;
    }
    
    return self;
}

- (makcipeAPIRecipeAPIClient *)recipeAPIClient {
    return _session.recipeService;
}

- (makcipeAPIUserAPIClient *)userAPIClient {
    return _session.userService;
}

- (NSError *)errorFromNSException:(NSException *)exception
{
    if (exception) {
        int errorCode = MakcipeAPIErrorCode_UNKNOWN;
        NSString *why = @"";
        if ([exception respondsToSelector:@selector(what)]) {
            // GMCore Thrift exception classes have an errorCode property
            errorCode = [(id)exception what];
            
            why = [(id)exception why];
        }
        else if ([exception isKindOfClass:[TException class]]) {
            // treat any Thrift errors as a transport error
            // TODO: we could create separate error codes for the various TException subclasses
            TTransportException *ttException = (TTransportException*)exception;
            
            why = ttException.reason;
            
            if ([why rangeOfString:@"501"].location != NSNotFound) {
                errorCode = MakcipeAPIErrorCode_INVALID_VERSION;
            }
            //            errorCode = WapleAPIErrorCode_TRANSPORT_ERROR;
        }
        
        SEL setErrorSelector = NSSelectorFromString(@"parameter");
        SEL setErrorReasonSelector = NSSelectorFromString(@"why");
        
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary:exception.userInfo];
        if ([exception respondsToSelector:setErrorSelector]) {
            NSString *parameter = nil; //[(id)exception parameter];
            if (parameter) {
                [userInfo setValue:parameter forKey:@"parameter"];
            }
        }
        
        if (why) {
            [userInfo setValue:why forKey:@"why"];
        }
        
        return [NSError errorWithDomain:MakcipeAPIErrorDomain code:errorCode userInfo:userInfo];
    }
    return nil;
}

- (void)invokeAsyncBoolBlock:(BOOL(^)())block
                     success:(void(^)(BOOL val))success
                     failure:(void(^)(NSError *error))failure
{
    dispatch_async(self.session.queue, ^(void) {
        __block BOOL retVal = NO;
        @try {
            if (block) {
                retVal = block();
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   if (success) {
                                       success(retVal);
                                   }
                               });
            }
        }
        @catch (NSException *exception) {
            NSError *error = [self errorFromNSException:exception];
            dispatch_async(dispatch_get_main_queue(),
                           ^{
                               if (failure) {
                                   failure(error);
                               }
                           });
        }
    });
}

- (void)invokeAsyncInt32Block:(int32_t(^)())block
                      success:(void(^)(int32_t val))success
                      failure:(void(^)(NSError *error))failure
{
    dispatch_async(self.session.queue, ^(void) {
        __block int32_t retVal = -1;
        @try {
            if (block) {
                retVal = block();
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   if (success) {
                                       success(retVal);
                                   }
                               });
            }
        }
        @catch (NSException *exception) {
            NSError *error = [self errorFromNSException:exception];
            dispatch_async(dispatch_get_main_queue(),
                           ^{
                               if (failure) {
                                   failure(error);
                               }
                           });
        }
    });
}

// use id instead of NSObject* so block type-checking is happy
- (void)invokeAsyncIdBlock:(id(^)())block
                   success:(void(^)(id))success
                   failure:(void(^)(NSError *error))failure
{
    dispatch_async(self.session.queue, ^(void) {
        id retVal = nil;
        @try {
            if (block) {
                retVal = block();
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   if (success) {
                                       success(retVal);
                                   }
                               });
            }
        }
        @catch (NSException *exception) {
            NSError *error = [self errorFromNSException:exception];
            dispatch_async(dispatch_get_main_queue(),
                           ^{
                               if (failure) {
                                   failure(error);
                               }
                           });
        }
    });
}

- (void)invokeAsyncVoidBlock:(void(^)())block
                     success:(void(^)())success
                     failure:(void(^)(NSError *error))failure
{
    dispatch_async(self.session.queue, ^(void) {
        @try {
            if (block) {
                block();
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   if (success) {
                                       success();
                                   }
                               });
            }
        }
        @catch (NSException *exception) {
            NSError *error = [self errorFromNSException:exception];
            dispatch_async(dispatch_get_main_queue(),
                           ^{
                               if (failure) {
                                   failure(error);
                               }
                           });
        }
    }); 
}

@end
