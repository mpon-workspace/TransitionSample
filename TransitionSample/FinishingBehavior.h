//
//  FinishingBehavior.h
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/01.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinishingBehavior : UIDynamicBehavior

@property (nonatomic) CGPoint targetPoint;
@property (nonatomic) CGPoint velocity;

- (instancetype) initWithItem:(id <UIDynamicItem>)item;

@end
