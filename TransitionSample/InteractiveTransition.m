//
//  InteractiveTransition.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/03.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "InteractiveTransition.h"

@interface InteractiveTransition ()

@property (nonatomic, weak) UIViewController *dismissingViewController;
@property (nonatomic, weak) id <UIViewControllerContextTransitioning> context;

@end

@implementation InteractiveTransition

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self;
}

//- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator
//{
//    return self;
//}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *to   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    to.view.alpha = 0.f;
    to.view.frame = [transitionContext finalFrameForViewController:to];
    
    // [transitionContext containerView] is UITransitionView
    [[transitionContext containerView] addSubview:to.view];
    
    [UIView animateWithDuration:0.3
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

#pragma mark - UIViewControllerInteractiveTransitioning

- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *to   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] insertSubview:to.view belowSubview:from.view];

    // remember
    self.dismissingViewController = from;
    self.context = transitionContext;
}

#pragma mark - UIPercentDrivenInteractiveTransition

- (void)updateInteractiveTransition:(CGFloat)percentComplete
{
    self.dismissingViewController.view.transform = CGAffineTransformMakeScale(percentComplete, percentComplete);
    [self.context updateInteractiveTransition:percentComplete];
}

- (void)cancelInteractiveTransition
{
    NSLog(@"%s", __func__);
}

- (void)finishInteractiveTransition
{
    NSLog(@"%s", __func__);
    [self.dismissingViewController.view removeFromSuperview];
    self.dismissingViewController = nil;
    [self.context completeTransition:YES];
}

@end
