//
//  InteractiveFromViewController.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/03.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "InteractiveFromViewController.h"
#import "InteractiveTransition.h"

@interface InteractiveFromViewController ()

@property (nonatomic) InteractiveTransition *transition;

@end

@implementation InteractiveFromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.transition = [[InteractiveTransition alloc] init];
    UIViewController *vc = segue.destinationViewController;
    vc.transitioningDelegate = self.transition;
}

@end
