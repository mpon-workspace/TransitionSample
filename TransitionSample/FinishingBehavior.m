//
//  FinishingBehavior.m
//  TransitionSample
//
//  Created by Masato Oshima on 2015/02/01.
//  Copyright (c) 2015年 Masato Oshima. All rights reserved.
//

#import "FinishingBehavior.h"

@interface FinishingBehavior ()

@property (nonatomic, strong) id <UIDynamicItem> item;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;
@property (nonatomic, strong) UIDynamicItemBehavior *itemBehavior;

@end

@implementation FinishingBehavior

- (instancetype) initWithItem:(id <UIDynamicItem>)item;
{
    if (self = [super init]) {
        self.item = item;
        
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.item attachedToAnchor:CGPointZero];
    attachmentBehavior.frequency = 3.5;
    attachmentBehavior.damping = 0.6;
    attachmentBehavior.length = 0;
    [self addChildBehavior:attachmentBehavior];
    self.attachmentBehavior = attachmentBehavior;
    
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.item]];
    itemBehavior.density = 100;
    itemBehavior.resistance = 25;
    [self addChildBehavior:itemBehavior];
    self.itemBehavior = itemBehavior;
}

- (void)setTargetPoint:(CGPoint)targetPoint
{
    _targetPoint = targetPoint;
    
    self.attachmentBehavior.anchorPoint = targetPoint;
}

- (void)setVelocity:(CGPoint)velocity
{
    _velocity = velocity;
    
    CGPoint currentVelocity = [self.itemBehavior linearVelocityForItem:self.item];
    CGPoint velocityDelta = CGPointMake(velocity.x - currentVelocity.x, velocity.y - currentVelocity.y);
    
    [self.itemBehavior addLinearVelocity:velocityDelta forItem:self.item];
}

@end
