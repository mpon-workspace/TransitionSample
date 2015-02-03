//
//  CustomNonFullScreenToViewController.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/03.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "CustomNonFullScreenToViewController.h"

@interface CustomNonFullScreenToViewController ()

@end

@implementation CustomNonFullScreenToViewController

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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dismissButtonDidPush:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
