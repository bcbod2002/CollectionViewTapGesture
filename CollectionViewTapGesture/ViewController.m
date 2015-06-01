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
    NSIndexPath *selectedCellIndexPath;
    
    NSMutableArray *allCellArray;
}

@end

@implementation ViewController

#pragma mark - View life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    screenSize = [UIScreen mainScreen].bounds.size;
    
    allCellArray = [[NSMutableArray alloc] init];
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
    tapFlowLayoutOne = [[tapCollectionViewFlowLayoutOne alloc] initWithCollectionViewSize:CGSizeMake(screenSize.width, screenSize.width)];
    tapFlowLayoutFour = [[tapCollectionViewFlowLayoutFour alloc] initWithCollectionViewSize:CGSizeMake(screenSize.width, screenSize.width)];

    tapGestureCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, (screenSize.height - screenSize.width) / 2, screenSize.width, screenSize.width) collectionViewLayout:tapFlowLayoutFour];
    [tapGestureCollectionView registerClass:[TapCollectionViewCell class] forCellWithReuseIdentifier:@"TapCell"];
    [tapGestureCollectionView setBackgroundColor:[UIColor colorWithRed:44.f / 255.f green:92.f / 255.f blue:1.f / 255.f alpha:1.f]];
    [tapGestureCollectionView setAlwaysBounceHorizontal:YES];
    [tapGestureCollectionView setAllowsMultipleSelection:NO];
    [tapGestureCollectionView setPagingEnabled:YES];
//    [tapGestureCollectionView setScrollEnabled:NO];
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
    TapCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TapCell" forIndexPath:indexPath];
    
    if (cell.tag != 213)
    {
        [allCellArray addObject:cell];
        [cell setTag:213];
    }
    NSLog(@"cell.gesture = %@", cell.gestureRecognizers);
    NSLog(@"collectionView gesture = %@", collectionView.gestureRecognizers);
    return cell;
}


#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TapCollectionViewCell *cell = (TapCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setPreviousFlowLayout:(UICollectionViewFlowLayout *)collectionView.collectionViewLayout];
    [cell.layer setBorderColor:[UIColor redColor].CGColor];
    selectedCellIndexPath = indexPath;
    
    if ([collectionView.collectionViewLayout isKindOfClass:[tapCollectionViewFlowLayoutOne class]])
    {
        [cell setNextFlowLayout:tapFlowLayoutFour];
    }
    else
    {
        [cell setNextFlowLayout:tapFlowLayoutOne];
    }
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TapCollectionViewCell *cell = (TapCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [[(TapCollectionViewCell *)cell cellNumberLabel] setText:[NSString stringWithFormat:@"%ld", (long)indexPath.row]];
    if (indexPath != selectedCellIndexPath)
    {
        [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
    }
    else
    {
        [cell.layer setBorderColor:[UIColor redColor].CGColor];
    }
}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButton actions
- (IBAction)scrollChangeButtonTouchInside:(UIButton *)sender
{
    if (tapGestureCollectionView.scrollEnabled && tapGestureCollectionView.pagingEnabled)
    {
        [tapGestureCollectionView setScrollEnabled:NO];
        [tapGestureCollectionView setPagingEnabled:NO];
        [sender setTitle:@"Scroll Disable" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor colorWithRed:215.f / 255.f green:55.f / 255.f blue:46.f / 255.f alpha:1.0f]];
    }
    else
    {
        [tapGestureCollectionView setScrollEnabled:YES];
        [tapGestureCollectionView setPagingEnabled:YES];
        [sender setTitle:@"Scroll Enable" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor colorWithRed:20.f / 255.f green:154.f / 255.f blue:47.f / 255.f alpha:1.0f]];
    }
    
}

- (IBAction)cellChangeButtonTouchInside:(UIButton *)sender
{
    TapCollectionViewCell *changeCell = [allCellArray objectAtIndex:0];
    if (changeCell.setCancelTouchesInViewTag)
    {
        for (TapCollectionViewCell *cell in allCellArray)
        {
            [cell setSetCancelTouchesInViewTag:NO];
        }
        [sender setTitle:@"Cancels Touches In View Disable" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor colorWithRed:215.f / 255.f green:55.f / 255.f blue:46.f / 255.f alpha:1.0f]];
    }
    else
    {
        for (TapCollectionViewCell *cell in allCellArray)
        {
            [cell setSetCancelTouchesInViewTag:YES];
        }
        [sender setTitle:@"Cancels Touches In View Enable" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor colorWithRed:20.f / 255.f green:154.f / 255.f blue:47.f / 255.f alpha:1.0f]];
    }
}
@end
