//
//  tapCollectionViewFlowLayoutFour.m
//  CollectionViewTapGesture
//
//  Created by Goston on 2015/5/13.
//  Copyright (c) 2015年 GostonWu. All rights reserved.
//

#import "tapCollectionViewFlowLayoutFour.h"

@implementation tapCollectionViewFlowLayoutFour
{
    CGSize _collectionViewSize;
}
-(instancetype)initWithCollectionViewSize:(CGSize)collectionViewSize
{
    self = [super init];
    if (self)
    {
        _collectionViewSize = collectionViewSize;
        self.itemSize = CGSizeMake(collectionViewSize.width / 2, collectionViewSize.height / 2);
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

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}
@end
