//
//  loginViewController.h
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 12..
//  Copyright (c) 2015년 Jin-young Ko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btn_close;
@property (strong, nonatomic) IBOutlet UIButton *btn_login_facebook;
@property (strong, nonatomic) IBOutlet UIButton *btn_login_kakao;
@property (strong, nonatomic) IBOutlet UIButton *btn_login_email;


- (IBAction)doClose:(UIButton *)sender;

#pragma mark - Facebook
- (IBAction)login_facebook:(UIButton *)sender;

#pragma mark - Kakao
- (IBAction)invokeLoginWithTarget:(UIButton *)sender;

#pragma mark - Email

@end
