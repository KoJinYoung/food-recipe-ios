//
//  etcViewController.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 9. 13..
//  Copyright (c) 2015년 Jin-young Ko. All rights reserved.
//

#import "etcViewController.h"

@implementation etcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    NSString *ver = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSString *build = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    if (ver && build) {
        [_label_version setText:[NSString stringWithFormat:@"%@(%@)", ver, build]];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
}

@end
