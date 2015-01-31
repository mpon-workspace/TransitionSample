//
//  DetailViewController.h
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/01.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - UIColor Additions

@interface UIColor (Additions)

+ (instancetype)backgroundColor;
+ (instancetype)foregroundColor;

@end

@interface DetailViewController : UIViewController <UIViewControllerTransitioningDelegate>

@end
