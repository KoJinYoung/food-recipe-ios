//
//  MakcipeAPIUserService.h
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 21..
//  Copyright © 2015년 Jin-young Ko. All rights reserved.
//

#import "MakcipeAPI.h"

@interface MakcipeAPIUserService : MakcipeAPI

+ (MakcipeAPIUserService *)userService;
- (id)initWithSession:(MakcipeAPISession *)session;

- (void) signup: (NSString *) email
       password: (NSString *) password
        success:(void (^)(makcipeAPIUser *response))success
        failure:(void (^)(NSError *error))failure;

- (void) signupWithFacebook: (NSString *) fb_id
                       name: (NSString *) name
                    pic_url: (NSString *) pic_url
                    success:(void (^)(makcipeAPIUser *response))success
                    failure:(void (^)(NSError *error))failure;

- (void) signupWithKakao: (NSString *) ko_id
                    name: (NSString *) name
                 pic_url: (NSString *) pic_url
                 success:(void (^)(makcipeAPIUser *response))success
                 failure:(void (^)(NSError *error))failure;

- (void) signin: (NSString *) email
       password: (NSString *) password
        success:(void (^)(makcipeAPIUser *response))success
        failure:(void (^)(NSError *error))failure;

- (void) signout: (NSString *) token
         success:(void (^)())success
         failure:(void (^)(NSError *error))failure;

- (void) withdraw: (NSString *) token
         password: (NSString *) password
          success:(void (^)())success
          failure:(void (^)(NSError *error))failure;

- (void) getUserInfo: (NSString *) token
             success:(void (^)(makcipeAPIUser *response))success
             failure:(void (^)(NSError *error))failure;
@end
