//
//  UIView+position.m
//  foodRecipe
//
//  Created by Jin-young Ko on 2015. 10. 8..
//  Copyright © 2015년 Jin-young Ko. All rights reserved.
//

#import "UIView+position.h"

@implementation UIView (position)

- (CGPoint)boundsCenter
{
    return CGPointMake(self.bounds.size.width/2.f, self.bounds.size.height/2.f);
}

@end
