//
//  CustomAnimatedTransition.h
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/01.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FinishingBehavior.h"

@interface CustomAnimatedTransition : NSObject <UIViewControllerAnimatedTransitioning, UIViewControllerInteractiveTransitioning, UIGestureRecognizerDelegate, UIDynamicAnimatorDelegate>

@property (assign, nonatomic) BOOL reversed;
@property (weak, nonatomic) id<UIViewControllerContextTransitioning> context;
@property (assign, nonatomic) CGPoint initialViewCenter;
@property (assign, nonatomic) CGFloat percentComplete;
@property (assign, nonatomic) NSTimeInterval startingTime;
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) FinishingBehavior *finishingBehavior;

@property (nonatomic) UIView *view;
@property (nonatomic) UIPanGestureRecognizer *gesture;

@end
