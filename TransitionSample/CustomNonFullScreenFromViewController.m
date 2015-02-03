//
//  CustomNonFullScreenFromViewController.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/03.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "CustomNonFullScreenFromViewController.h"
#import "CustomNonFullScreenTransition.h"

@interface CustomNonFullScreenFromViewController ()

@property (nonatomic) CustomNonFullScreenTransition *transition;

@end

@implementation CustomNonFullScreenFromViewController

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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transition = [[CustomNonFullScreenTransition alloc] init];
    UIViewController *toVc = segue.destinationViewController;
    toVc.transitioningDelegate = self.transition;
    
}


@end
