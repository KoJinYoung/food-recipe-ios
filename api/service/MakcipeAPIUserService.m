//
//  MakcipeAPIUserService.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 21..
//  Copyright © 2015년 Jin-young Ko. All rights reserved.
//

#import "MakcipeAPIUserService.h"

@implementation MakcipeAPIUserService

+ (MakcipeAPIUserService *)userService
{
    MakcipeAPIUserService *userService = [[MakcipeAPIUserService alloc] initWithSession:[MakcipeAPISession sharedSession]];
    return userService;
}

- (id)initWithSession:(MakcipeAPISession *)session
{
    self = [super initWithSession:session];
    if (self) {
        
    }
    return self;
}

// APIs

- (void)signup:(NSString *)email password:(NSString *)password success:(void (^)(makcipeAPIUser *))success failure:(void (^)(NSError *))failure
{
    [self invokeAsyncIdBlock:^id{
        return [self.userAPIClient signup:email password:password];
    } success:success failure:failure];
}

- (void)signupWithFacebook:(NSString *)fb_id name:(NSString *)name pic_url:(NSString *)pic_url success:(void (^)(makcipeAPIUser *))success failure:(void (^)(NSError *))failure
{
    [self invokeAsyncIdBlock:^id{
        return [self.userAPIClient signupWithFacebook:fb_id name:name pic_url:pic_url];
    } success:success failure:failure];
}

- (void)signupWithKakao:(NSString *)ko_id name:(NSString *)name pic_url:(NSString *)pic_url success:(void (^)(makcipeAPIUser *))success failure:(void (^)(NSError *))failure
{
    [self invokeAsyncIdBlock:^id{
        return [self.userAPIClient signupWithKakao:ko_id name:name pic_url:pic_url];
    } success:success failure:failure];
}

- (void)signin:(NSString *)email password:(NSString *)password success:(void (^)(makcipeAPIUser *))success failure:(void (^)(NSError *))failure
{
    [self invokeAsyncIdBlock:^id{
        return [self.userAPIClient signin:email password:password];
    } success:success failure:failure];
}

- (void)signout:(NSString *)token success:(void (^)())success failure:(void (^)(NSError *))failure
{
    [self invokeAsyncVoidBlock:^{
        [self.userAPIClient signout:token];
    } success:success failure:failure];
}

- (void)withdraw:(NSString *)token password:(NSString *)password success:(void (^)())success failure:(void (^)(NSError *))failure
{
    [self invokeAsyncVoidBlock:^{
        [self.userAPIClient withdraw:token password:password];
    } success:success failure:failure];
}

- (void)getUserInfo:(NSString *)token success:(void (^)(makcipeAPIUser *))success failure:(void (^)(NSError *))failure
{
    [self invokeAsyncIdBlock:^id{
        return [self.userAPIClient getUserInfo:token];
    } success:success failure:failure];
}

@end
