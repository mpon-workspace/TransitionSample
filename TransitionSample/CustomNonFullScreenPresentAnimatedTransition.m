//
//  CustomNonFullScreenPresentAnimatedTransition.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/03.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "CustomNonFullScreenPresentAnimatedTransition.h"

@implementation CustomNonFullScreenPresentAnimatedTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *to   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *v = [[UIView alloc] initWithFrame:[transitionContext initialFrameForViewController:from]];
    v.backgroundColor = from.view.backgroundColor;
    [[transitionContext containerView] addSubview:v];
    [[transitionContext containerView] addSubview:to.view];
    to.view.alpha = 0;
    to.view.frame = CGRectInset([transitionContext initialFrameForViewController:from], 32.f, 132.f);
    
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         to.view.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
