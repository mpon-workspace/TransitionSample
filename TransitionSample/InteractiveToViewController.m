//
//  InteractiveToViewController.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/03.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "InteractiveToViewController.h"
#import "InteractiveTransition.h"

@interface InteractiveToViewController ()

@end

@implementation InteractiveToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [self.view addGestureRecognizer:pinch];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handlePinch:(UIPinchGestureRecognizer *)pinch
{
    switch (pinch.state) {
        case UIGestureRecognizerStateBegan: {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged: {
            InteractiveTransition *transition = (InteractiveTransition *)self.transitioningDelegate;
            CGFloat percentComplete = pinch.scale > 1 ? 1 : pinch.scale;
            [transition updateInteractiveTransition:percentComplete];
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            InteractiveTransition *transition = (InteractiveTransition *)self.transitioningDelegate;
            [transition finishInteractiveTransition];
        }
            break;
        default:
            break;
    }
}

@end
