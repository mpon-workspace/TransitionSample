//
//  CustomFullScreenTransition.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/01.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "CustomFullScreenTransition.h"
#import "CustomFullScreenAnimatedTransitioning.h"

@implementation CustomFullScreenTransition

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source
{
    return [[CustomFullScreenAnimatedTransitioning alloc] init];
}


- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[CustomFullScreenAnimatedTransitioning alloc] init];
}

@end
