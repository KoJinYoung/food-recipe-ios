//
//  MakcipeAPISession.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 11..
//  Copyright (c) 2015년 MakSSe. All rights reserved.
//

#import "Server.h"

#define MAKCIPESERVICE_SERVER_HOST                  MAKCIPE_SERVICE_SERVER_HOST
#define MAKCIPESERVICE_SERVER_HOST_DEV              MAKCIPE_SERVICE_SERVER_HOST_DEV

#define MAKCIPESERVICE_RECIPE_PATH                  @""

#define RecipeSvcTimeoutInterval                    60.0f


#import "MakcipeAPISession.h"
#import <thrift/THTTPClient.h>
#import <thrift/TBinaryProtocol.h>

@implementation MakcipeAPISession
@synthesize authenticationToken = _authenticationToken;
@synthesize devServer = _devServer;

- (id)init {
    
    if (self = [super init]) {
        _userAgentString = nil;
        _recipeSvcTimeoutInterval = RecipeSvcTimeoutInterval;

        _isAuthExpired = NO;
        _authenticationToken = nil;
        
        _queue = dispatch_queue_create("", nil);
        
        _Servers = [[NSArray alloc] initWithObjects:nil];
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

- (NSString *)devServer
{
    self.devServer = MAKCIPESERVICE_SERVER_HOST_DEV;
    return _devServer;
}

- (void)setDevServer:(NSString *)devServer
{
    if (_devServer != devServer) {
        _devServer = devServer;
    }
}

- (NSString *)getHostName
{
    NSString *hostName;
    
#ifdef CREAM_SERVER_REAL
    hostName = MAKCIPESERVICE_SERVER_HOST;
#else
    hostName = self.devServer;
#endif
    
    return hostName;
}

- (NSString *)recipeSvcUrl
{
    return [[self getHostName] stringByAppendingString:MAKCIPESERVICE_RECIPE_PATH];
}

- (makcipeAPIRecipeAPIClient *)recipeService
{
    NSURL *url = [NSURL URLWithString:self.recipeSvcUrl];
    THTTPClient *transport = [[THTTPClient alloc] initWithURL:url userAgent:self.userAgentString timeout:self.recipeSvcTimeoutInterval];
    TBinaryProtocol *protocol = [[TBinaryProtocol alloc] initWithTransport:transport];
    return [[makcipeAPIRecipeAPIClient alloc] initWithProtocol:protocol];
}

@end
