//
//  CustomNonFullScreenDismisalAnimatedTransition.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/03.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "CustomNonFullScreenDismisalAnimatedTransition.h"

@implementation CustomNonFullScreenDismisalAnimatedTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         from.view.alpha = 0;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];

}

@end
