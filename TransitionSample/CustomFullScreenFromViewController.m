//
//  CustomFullScreenFromViewController.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/01.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "CustomFullScreenFromViewController.h"
#import "CustomFullScreenToViewController.h"
#import "CustomFullScreenTransition.h"

@interface CustomFullScreenFromViewController ()

@property (nonatomic) CustomFullScreenTransition *transition;

@end

@implementation CustomFullScreenFromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s%d", __func__, animated);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"%s%d", __func__, animated);
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    CustomFullScreenToViewController *toVc = segue.destinationViewController;
    self.transition = [[CustomFullScreenTransition alloc] init];
    toVc.transitioningDelegate = self.transition;
}

@end
