//
//  CustomFullScreenAnimatedTransitioning.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/03.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "CustomFullScreenAnimatedTransitioning.h"

@implementation CustomFullScreenAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *to   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    to.view.alpha = 0.f;
    to.view.frame = [transitionContext finalFrameForViewController:to];
    
    // [transitionContext containerView] is UITransitionView
    [[transitionContext containerView] addSubview:to.view];
    
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         from.view.transform = CGAffineTransformMakeRotation(M_PI);
                         from.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
                         to.view.alpha = 1.f;
                     }
                     completion:^(BOOL finished) {
                         from.view.transform = CGAffineTransformIdentity;
                         [transitionContext completeTransition:YES];
                     }];
}

@end
