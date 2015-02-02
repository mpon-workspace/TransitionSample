//
//  CustomFullScreenToViewController.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/01.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "CustomFullScreenToViewController.h"

@interface CustomFullScreenToViewController ()

@end

@implementation CustomFullScreenToViewController

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

- (void)dismissButtonDidPush:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
