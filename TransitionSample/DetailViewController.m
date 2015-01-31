//
//  DetailViewController.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/01.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "DetailViewController.h"
#import "CustomAnimatedTransition.h"

@implementation UIColor (Additions)

+ (instancetype)backgroundColor
{
    return [self colorWithRed:25.0/255.0 green:163.0/255.0 blue:177.0/255.0 alpha:1.0];
}

+ (instancetype)foregroundColor
{
    return [self colorWithRed:255.0/255.0 green:251.0/255.0 blue:224.0/255.0 alpha:1.0];
}

@end

@interface DetailViewController ()

@property (nonatomic, strong) CustomAnimatedTransition *transition;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor foregroundColor];
    self.view.layer.cornerRadius = 10.0f;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)tapped:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    self.transition = CustomAnimatedTransition.new;
    
    return self.transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transition.reversed = YES;
    
    return self.transition;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return (id<UIViewControllerInteractiveTransitioning>)animator;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return (id<UIViewControllerInteractiveTransitioning>)animator;
}

@end
