//
//  myRecipeViewController.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 13..
//  Copyright (c) 2015년 Jin-young Ko. All rights reserved.
//

#import "myRecipeViewController.h"
#import "accountManager.h"
#import "storyboard.h"

@implementation myRecipeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if ([accountManager hasToken]) {
        
    }
    else {
        
    }
}

- (void) openLoginPage {
    
    UINavigationController *nc = (UINavigationController*)[myStoryBoard() instantiateViewControllerWithIdentifier:@"loginNavigationController"];
    
    [self presentViewController:nc animated:YES completion:nil];
}

@end
