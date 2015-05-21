//
//  TapCollectionViewCell.h
//  CollectionViewTapGesture
//
//  Created by Goston on 2015/5/13.
//  Copyright (c) 2015年 GostonWu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tapCollectionViewFlowLayoutFour.h"
#import "tapCollectionViewFlowLayoutOne.h"

@interface TapCollectionViewCell : UICollectionViewCell

@property (nonatomic, readwrite) UICollectionViewFlowLayout *previousFlowLayout;
@property (nonatomic, readwrite) UICollectionViewFlowLayout *nowFlowLayout;

@end
