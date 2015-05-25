//
//  tapCollectionViewFlowLayoutFour.m
//  CollectionViewTapGesture
//
//  Created by Goston on 2015/5/13.
//  Copyright (c) 2015年 GostonWu. All rights reserved.
//

#import "tapCollectionViewFlowLayoutFour.h"

@implementation tapCollectionViewFlowLayoutFour
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.itemSize = CGSizeMake(self.collectionView.frame.size.width / 2, self.collectionView.frame.size.height / 2);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsZero;
        self.minimumInteritemSpacing = 0;
        self.minimumLineSpacing = 0;
    }

    return self;
}

-(void)prepareLayout
{
    [super prepareLayout];
}

-(CGSize)itemSize
{
    [super itemSize];
    return CGSizeMake(self.collectionView.frame.size.width / 2, self.collectionView.frame.size.height / 2);
}

-(CGSize)collectionViewContentSize
{
    [super collectionViewContentSize];
    return CGSizeMake(self.collectionView.frame.size.width / 2, self.collectionView.frame.size.height / 2);
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    self.itemSize = CGSizeMake(newBounds.size.width / 2, newBounds.size.height / 2);
    return YES;
}

-(void)prepareForAnimatedBoundsChange:(CGRect)oldBounds
{
    NSLog(@"prepareForAnimatedBoundsChange One One Old = %@", oldBounds);
}

-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}
@end
