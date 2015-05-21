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
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
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
@end
