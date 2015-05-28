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

}

-(void)prepareForReuse
{
    [super prepareForReuse];
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

        // Cell number Label
        _cellNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.contentView.frame.size.width - 20.f) / 2, (self.contentView.frame.size.height - 16.f) / 2, 20.f, 16.f)];
        [_cellNumberLabel setFont:[UIFont systemFontOfSize:20.f]];
        [_cellNumberLabel setTextAlignment:NSTextAlignmentCenter];
        [_cellNumberLabel setTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_cellNumberLabel];

        // Double tap gesture
        UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapTransitionFlowLayout:)];
        [doubleTapGesture setNumberOfTapsRequired:2];
        [doubleTapGesture setNumberOfTouchesRequired:1];
//        [doubleTapGesture setCancelsTouchesInView:NO];
        [self addGestureRecognizer:doubleTapGesture];

    }

    return self;
}

/**
 *  To refresh Cell number UILabel
 *
 *  @param newLayout New UICollectionViewLayout
 */
-(void)refreshNumberLabelFrameWithLayout:(UICollectionViewLayout *)newLayout
{
    [_cellNumberLabel setFrame:CGRectMake((self.contentView.frame.size.width - 20.f) / 2, (self.contentView.frame.size.height - 16.f) / 2, 20.f, 16.f)];
}

#pragma mark - Override cell functions
-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    return layoutAttributes;
}

-(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
}

-(void)willTransitionFromLayout:(UICollectionViewLayout *)oldLayout toLayout:(UICollectionViewLayout *)newLayout
{
    [super willTransitionFromLayout:oldLayout toLayout:newLayout];
//    NSLog(@"Old flowlayout = %f, %f", [(UICollectionViewFlowLayout *)oldLayout.collectionView.collectionViewLayout itemSize].width, [(UICollectionViewFlowLayout *)oldLayout.collectionView.collectionViewLayout itemSize].height);
    
//    NSLog(@"New flowlayout = %f, %f", [(UICollectionViewFlowLayout *)newLayout.collectionView.collectionViewLayout itemSize].width, [(UICollectionViewFlowLayout *)newLayout.collectionView.collectionViewLayout itemSize].height);
}

-(void)didTransitionFromLayout:(UICollectionViewLayout *)oldLayout toLayout:(UICollectionViewLayout *)newLayout
{
    [super didTransitionFromLayout:oldLayout toLayout:newLayout];
    [self refreshNumberLabelFrameWithLayout:newLayout];
}

#pragma mark - UITapGestureRecognization
-(void)doubleTapTransitionFlowLayout:(UITapGestureRecognizer *)sender
{
    [self realTapTransitionWithFlowLayout];
}

-(void)realTapTransitionWithFlowLayout
{
    UICollectionView *superCollectionView = (UICollectionView *)self.superview;
    [superCollectionView setCollectionViewLayout:_nextFlowLayout animated:YES];
    if ([_delegate respondsToSelector:@selector(didChangecollectionWithCollectionViewFlowLayout:)])
    {
        [_delegate didChangecollectionWithCollectionViewFlowLayout:_nextFlowLayout];
    }


}

@end
