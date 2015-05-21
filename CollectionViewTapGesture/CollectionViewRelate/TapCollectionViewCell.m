//
//  TapCollectionViewCell.m
//  CollectionViewTapGesture
//
//  Created by Goston on 2015/5/13.
//  Copyright (c) 2015年 GostonWu. All rights reserved.
//

#import "TapCollectionViewCell.h"

@implementation TapCollectionViewCell
{
    tapCollectionViewFlowLayoutOne *flowLayoutOne;
    tapCollectionViewFlowLayoutFour *flowLayoutFour;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:[UIColor colorWithRed:253.f / 255.f green:164.f / 255.f blue:9.f / 255.f alpha:1.f]];
        [self.layer setBorderWidth:2.f];
        [self.layer setBorderColor:[UIColor whiteColor].CGColor];
        [self.layer setCornerRadius:30.f];

        flowLayoutFour = [[tapCollectionViewFlowLayoutFour alloc] init];
        flowLayoutOne = [[tapCollectionViewFlowLayoutOne alloc] init];

        // Double tap gesture
        UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapTransitionFlowLayout:)];
        [doubleTapGesture setNumberOfTapsRequired:2];
        [doubleTapGesture setNumberOfTouchesRequired:1];
        [doubleTapGesture setCancelsTouchesInView:NO];
        [self addGestureRecognizer:doubleTapGesture];

    }

    return self;
}

-(void)willTransitionFromLayout:(UICollectionViewLayout *)oldLayout toLayout:(UICollectionViewLayout *)newLayout
{

}

-(void)didTransitionFromLayout:(UICollectionViewLayout *)oldLayout toLayout:(UICollectionViewLayout *)newLayout
{

}

-(void)doubleTapTransitionFlowLayout:(UITapGestureRecognizer *)sender
{
    [self realTapTransitionWithFlowLayout];
}

-(void)realTapTransitionWithFlowLayout
{
    NSLog(@"self.superView = %@", self.superview);
    UICollectionView *superCollectionView = (UICollectionView *)self.superview;
    if ([_previousFlowLayout isKindOfClass:[tapCollectionViewFlowLayoutOne class]])
    {
        [superCollectionView setCollectionViewLayout:flowLayoutFour animated:YES];
    }
    else
    {
        [superCollectionView setCollectionViewLayout:flowLayoutOne animated:YES];
    }

}

@end
