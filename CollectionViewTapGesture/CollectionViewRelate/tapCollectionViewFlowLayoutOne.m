//
//  tapCollectionViewFlowLayoutOne.m
//  CollectionViewTapGesture
//
//  Created by Goston on 2015/5/13.
//  Copyright (c) 2015年 GostonWu. All rights reserved.
//

#import "tapCollectionViewFlowLayoutOne.h"

@implementation tapCollectionViewFlowLayoutOne

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.itemSize = CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
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
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
}

-(CGSize)collectionViewContentSize
{
    [super collectionViewContentSize];
    return CGSizeMake(self.collectionView.frame.size.width * 8, self.collectionView.frame.size.height);
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    self.itemSize = newBounds.size;
    return YES;
}

-(void)prepareForAnimatedBoundsChange:(CGRect)oldBounds
{
    NSLog(@"prepareForAnimatedBoundsChange four four Old = %@", oldBounds);
}

-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}

@end
