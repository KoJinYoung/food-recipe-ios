//
//  MakcipeAPISession.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 11..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

#import "Server.h"

#define MAKCIPESERVICE_RECIPE_NAME                  @"RecipeAPI"
#define MAKCIPESERVICE_USER_NAME                    @"UserAPI"

#define RecipeSvcTimeoutInterval                    60.0f
#define UserSvcTimeoutInterval                    60.0f


#import "MakcipeAPISession.h"
#import <thrift/THTTPClient.h>
#import <thrift/TSocketClient.h>
#import <thrift/TBinaryProtocol.h>
#import <thrift/TMultiplexedProtocol.h>

@implementation MakcipeAPISession
@synthesize authenticationToken = _authenticationToken;

- (id)init {
    
    if (self = [super init]) {
        _userAgentString = nil;
        _recipeSvcTimeoutInterval = RecipeSvcTimeoutInterval;
        _userSvcTimeoutInterval = UserSvcTimeoutInterval;

        _isAuthExpired = NO;
        _authenticationToken = nil;
        
        _queue = dispatch_queue_create("", nil);
        
        _Servers = [[NSArray alloc] init];
    }
    return self;
}

+ (void)setSharedSessionUserAgent:(NSString *)userAgent {
    MakcipeAPISession *session = [self sharedSession];
    session.userAgentString = userAgent;
}

+ (MakcipeAPISession *)sharedSession {
    
    static MakcipeAPISession *sharedSession;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedSession = [[self alloc] init];
    });
    return sharedSession;
}

- (NSString *)authenticationToken
{
    NSString *token = nil;
//    STLoginData *loginData = [self getLoginData];
//    if (loginData) {
//        if (loginData.authToken && loginData.authToken.length > 0) {
//            token = loginData.authToken;
//        }
//    }
    return token;
}

- (BOOL)isAuthenticated
{
    return (self.authenticationToken != nil);
}

- (NSString *)getHostName
{
    return MAKCIPE_SERVER_HOST;
}

- (int)getPort
{
    return MAKCIPE_SERVER_HOST_PORT;
}

- (makcipeAPIRecipeAPIClient *)recipeService
{
    TSocketClient *transport = [[TSocketClient alloc] initWithHostname:[self getHostName] port:[self getPort]];
    TBinaryProtocol *protocol = [[TBinaryProtocol alloc] initWithTransport:transport];
    TMultiplexedProtocol *muxProtocol = [[TMultiplexedProtocol alloc] initWithProtocol:protocol serviceName:MAKCIPESERVICE_RECIPE_NAME];
    return [[makcipeAPIRecipeAPIClient alloc] initWithProtocol:muxProtocol];
}

- (makcipeAPIUserAPIClient *)userService
{
    TSocketClient *transport = [[TSocketClient alloc] initWithHostname:[self getHostName] port:[self getPort]];
    TBinaryProtocol *protocol = [[TBinaryProtocol alloc] initWithTransport:transport];
    TMultiplexedProtocol *muxProtocol = [[TMultiplexedProtocol alloc] initWithProtocol:protocol serviceName:MAKCIPESERVICE_USER_NAME];
    return [[makcipeAPIUserAPIClient alloc] initWithProtocol:muxProtocol];
}

@end
