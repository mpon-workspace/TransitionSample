//
//  CustomAnimatedTransition.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/01.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "CustomAnimatedTransition.h"

@implementation CustomAnimatedTransition

- (instancetype) init {
    
    if (self = [super init]) {
        _reversed = NO;
    }
    
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;
{
    CGPoint location = [gestureRecognizer locationInView:self.context.containerView];
    
    CALayer *presentationLayer = self.view.layer.presentationLayer;
    
    if ([presentationLayer hitTest:location])
    {
        return YES;
    }else{
        return NO;
    }
}

- (void)tick:(CADisplayLink *)link
{
    NSTimeInterval elapedTime = link.timestamp - self.startingTime;
    NSTimeInterval duration = 0.5;
    
    self.percentComplete = MIN(1.0, elapedTime / duration);
    
    [self.context updateInteractiveTransition:self.percentComplete];
}

- (void)didPan:(UIPanGestureRecognizer *)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStatePossible:
            break;
        case UIGestureRecognizerStateBegan: {
            CALayer *layer = self.view.layer.presentationLayer ?: self.view.layer;
            self.view.center = layer.position;
            [self.view.layer removeAllAnimations];
            
            
            self.initialViewCenter = self.view.center;
            
            [self.animator removeAllBehaviors];
            
            break;
        }
        case UIGestureRecognizerStateChanged:{
            CGPoint translation = [gesture translationInView:gesture.view];
            
            CGPoint centerTranslated = self.initialViewCenter;
            centerTranslated.x += translation.x;
            centerTranslated.y += translation.y;
            
            self.view.center = centerTranslated;
            
            CGFloat percentComplete = MAX(MIN(self.view.center.y / 284, 1.0), 0.0);
            
            if (self.reversed) percentComplete = 1.0f - percentComplete;
            
            [self.context updateInteractiveTransition:percentComplete];
            
            break;
        }
        case UIGestureRecognizerStateEnded:{
            
            CGPoint velocity = [gesture velocityInView:gesture.view];
            CGPoint location = [gesture locationInView:gesture.view];
            
            static const CGFloat kTransitionGestureVelocityThreshold = 50.0f;
            static const CGFloat kTransitionGestureLocationThreshold = 284.0f;
            
            BOOL shouldFinish;
            
            if (ABS(velocity.y) > kTransitionGestureVelocityThreshold) {
                shouldFinish = velocity.y > 0;
            } else {
                shouldFinish = location.y > kTransitionGestureLocationThreshold;
                
            }
            
            if (self.reversed) shouldFinish = !shouldFinish;
            
            if (shouldFinish) {
                [self.context finishInteractiveTransition];
            } else {
                [self.context cancelInteractiveTransition];
            }
            
            CGPoint finishCenter;
            
            if (shouldFinish) {
                if (self.reversed) {
                    finishCenter = CGPointMake(self.context.containerView.center.x, -100);
                }else{
                    finishCenter = self.context.containerView.center;
                }
            }else{
                if (self.reversed) {
                    finishCenter = self.context.containerView.center;
                }else{
                    finishCenter = CGPointMake(self.context.containerView.center.x, -100);
                }
            }
            
            if (shouldFinish) {
                [self.context finishInteractiveTransition];
            }else{
                [self.context cancelInteractiveTransition];
            }
            
            self.finishingBehavior = [[FinishingBehavior alloc] initWithItem:self.view];
            self.finishingBehavior.targetPoint = finishCenter;
            
            if (!CGPointEqualToPoint(velocity, CGPointZero)) {
                self.finishingBehavior.velocity = velocity;
            }
            
            __weak typeof(self) weakSelf = self;
            
            self.finishingBehavior.action = ^{
                if (!CGRectIntersectsRect(gesture.view.frame, weakSelf.view.frame)) {
                    [weakSelf.animator removeAllBehaviors];
                }
            };
            
            [self.animator addBehavior:self.finishingBehavior];
            
            break;
        }
        case UIGestureRecognizerStateCancelled:
            break;
        case UIGestureRecognizerStateFailed:
            break;
        default:
            break;
    }
}

- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator
{
    [self.animator removeAllBehaviors];
    
    for (UIGestureRecognizer *gesture in [[self.context containerView] gestureRecognizers]) {
        [gesture.view removeGestureRecognizer:gesture];
    }
    
    [self.context completeTransition:![self.context transitionWasCancelled]];
}

- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.context = transitionContext;
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    UIView *container = [transitionContext containerView];
    
    if (!self.reversed) {
        self.view = toView;
    }else{
        self.view = fromView;
    }
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:container];
    self.animator.delegate = self;
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)];
    [container addGestureRecognizer:gesture];
    gesture.delegate = self;
    
    self.startingTime = CACurrentMediaTime();
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    if (!self.reversed) {
        self.view.bounds = CGRectMake(0, 0, 280, 180);
        self.view.center = CGPointMake(container.center.x, -90);
        
        [container addSubview:self.view];
        
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction animations:^{
            
            self.view.center = container.center;
            
        } completion:^(BOOL finished) {
            [self.displayLink invalidate];
            
            if (finished){
                [gesture.view removeGestureRecognizer:gesture];
                
                [transitionContext finishInteractiveTransition];
                [transitionContext completeTransition:YES];
            }
            
            
        }];
    }else{
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction animations:^{
            
            self.view.center = CGPointMake(container.center.x, -90);
            
        } completion:^(BOOL finished) {
            [self.displayLink invalidate];
            
            if (finished){
                [gesture.view removeGestureRecognizer:gesture];
                
                [transitionContext finishInteractiveTransition];
                [transitionContext completeTransition:YES];
            }
        }];
    }
}

@end
