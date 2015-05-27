//
//  ViewController.m
//  CollectionViewTapGesture
//
//  Created by Goston on 2015/5/13.
//  Copyright (c) 2015年 GostonWu. All rights reserved.
//

#import "ViewController.h"
#import "TapCollectionViewCell.h"
#import "tapCollectionViewFlowLayoutOne.h"
#import "tapCollectionViewFlowLayoutFour.h"

@interface ViewController ()
{
    CGSize screenSize;
    UICollectionView *tapGestureCollectionView;
    tapCollectionViewFlowLayoutOne *tapFlowLayoutOne;
    tapCollectionViewFlowLayoutFour *tapFlowLayoutFour;
//    NSIndexPath
}

@end

@implementation ViewController

#pragma mark - View life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    screenSize = [UIScreen mainScreen].bounds.size;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initialCollectionView];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark - Initiate
-(void)initialCollectionView
{
    tapFlowLayoutOne = [[tapCollectionViewFlowLayoutOne alloc] initWithCollectionViewSize:screenSize];
    tapFlowLayoutFour = [[tapCollectionViewFlowLayoutFour alloc] initWithCollectionViewSize:screenSize];

    tapGestureCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, (screenSize.height - screenSize.width) / 2, screenSize.width, screenSize.width) collectionViewLayout:tapFlowLayoutOne];
    [tapGestureCollectionView registerClass:[TapCollectionViewCell class] forCellWithReuseIdentifier:@"TapCell"];
    [tapGestureCollectionView setBackgroundColor:[UIColor colorWithRed:44.f / 255.f green:92.f / 255.f blue:1.f / 255.f alpha:1.f]];
    [tapGestureCollectionView setAlwaysBounceHorizontal:YES];
    [tapGestureCollectionView setAllowsMultipleSelection:NO];
    [tapGestureCollectionView setPagingEnabled:YES];
    [tapGestureCollectionView setDelegate:self];
    [tapGestureCollectionView setDataSource:self];

    [self.view addSubview:tapGestureCollectionView];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TapCollectionViewCell *cell = (TapCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"TapCell" forIndexPath:indexPath];

    return cell;
}


#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TapCollectionViewCell *cell = (TapCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setPreviousFlowLayout:(UICollectionViewFlowLayout *)collectionView.collectionViewLayout];
    [cell.layer setBorderColor:[UIColor blueColor].CGColor];
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TapCollectionViewCell *cell = (TapCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [[(TapCollectionViewCell *)cell cellNumberLabel] setText:[NSString stringWithFormat:@"%ld", (long)indexPath.row]];
}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
