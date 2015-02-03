//
//  CustomNonFullScreenTransition.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/03.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "CustomNonFullScreenTransition.h"
#import "CustomNonFullScreenPresentAnimatedTransition.h"
#import "CustomNonFullScreenDismisalAnimatedTransition.h"

@implementation CustomNonFullScreenTransition

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[CustomNonFullScreenPresentAnimatedTransition alloc] init];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[CustomNonFullScreenDismisalAnimatedTransition alloc] init];
}

@end
