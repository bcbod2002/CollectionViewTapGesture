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

//-(CGSize)itemSize
//{
//    [super itemSize];
//    return CGSizeMake(_collectionViewSize.width / 2, _collectionViewSize.height / 2);
//}

//-(CGSize)collectionViewContentSize
//{
////    NSLog(@"Four collectionViewContentSize");
////    NSLog(@"self.collectionView.frame.size.width = %f", self.collectionView.frame.size.width);
//    [super collectionViewContentSize];
//    return CGSizeMake(self.collectionView.frame.size.width * 2, self.collectionView.frame.size.height);
//}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
//    NSLog(@"Four Four newBounds = %f, %f", newBounds.size.width, newBounds.size.height);
//    self.itemSize = CGSizeMake(newBounds.size.width / 2, newBounds.size.height / 2);
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
