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

@class TapCollectionViewCell;
@protocol TapCollectionViewCellDelegate <NSObject>
@optional
-(void)didChangecollectionWithCollectionViewFlowLayout:(UICollectionViewFlowLayout *)collectionViewFlowLayout;
@end

@interface TapCollectionViewCell : UICollectionViewCell

#pragma mark - Variables
@property (nonatomic, strong) UILabel *cellNumberLabel;
@property (nonatomic, weak) id <TapCollectionViewCellDelegate> delegate;
@property (nonatomic, readwrite) UICollectionViewFlowLayout *previousFlowLayout;
@property (nonatomic, readwrite) UICollectionViewFlowLayout *nowFlowLayout;

#pragma mark - Functions

@end
