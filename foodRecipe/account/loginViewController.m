//
//  loginViewController.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 12..
//  Copyright (c) 2015년 Jin-young Ko. All rights reserved.
//

#import "loginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <KakaoOpenSDK/KakaoOpenSDK.h>

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)doClose:(UIButton *)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Facebook
- (void)fbLoginButtonInit {
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [self.btn_login_facebook setTitle:@"Facebook Logout" forState:UIControlStateNormal];
    }
    else {
        [self.btn_login_facebook setTitle:@"Facebook Login" forState:UIControlStateNormal];
    }
}

- (void)login_facebook:(UIButton *)sender {
    
    FBSDKLoginManager* fbLoginManager = [[FBSDKLoginManager alloc] init];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [fbLoginManager logOut];
        [self.btn_login_facebook setTitle:@"Facebook Login" forState:UIControlStateNormal];
    }
    else {
        [fbLoginManager logInWithReadPermissions:@[@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
            if (error) {
                NSLog(@"error: %@", [error localizedDescription]);
            }
            else {
                FBSDKLoginManagerLoginResult* fbLoginResult = result;
                if ([[fbLoginResult grantedPermissions] containsObject:@"email"]) {
                    [self.btn_login_facebook setTitle:@"Facebook Logout" forState:UIControlStateNormal];
                    [self getFBUserData];
                }
            }
        }];
    }
}

- (void)getFBUserData {
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields":@"id, name, first_name, last_name, picture.type(large), email"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if (error == nil) {
                NSString* fbid = result[@"id"];
                [self loginByFacebook:fbid];
            }
        }];
    }
}

- (void)loginByFacebook:(NSString*)fbid {
    
}

#pragma mark - Kakao
- (void)koLoginButtonInit {
    
}

- (void)invokeLoginWithTarget:(UIButton *)sender {
    [[KOSession sharedSession] close];
    
    [[KOSession sharedSession] openWithCompletionHandler:^(NSError *error) {
        if ([[KOSession sharedSession] isOpen]) {
            [KOSessionTask meTaskWithCompletionHandler:^(id result, NSError *error) {
                if (result) {
                    KOUser* user = (KOUser*)result;
                    NSLog(@"kakaotalk user id: %@", user.ID.stringValue);
                }
            }];
        }
    } authParams:nil authType:KOAuthTypeTalk];
}

#pragma mark - Email

@end
