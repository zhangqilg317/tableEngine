//
//  ZZGridTableConllectionView.m
//  tableEngineTest
//
//  Created by 张奇 on 14-8-8.
//  Copyright (c) 2014年 com.ebest. All rights reserved.
//

#import "ZZGridTableConllectionView.h"


#import "ZZGridTableCell.h"
#import "ZZGridTableFlowLayout.h"
#import "ZZConstants.h"

@interface ZZGridTableConllectionView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@end

@implementation ZZGridTableConllectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:[ZZGridTableFlowLayout new]];
    
    if (self) {
        // Initialization code
        
        [self setDataSource:self];
        [self setDelegate:self];
        
        [self setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
        
        [self registerClass:[ZZGridTableCell class] forCellWithReuseIdentifier:REUSE_IDENTIFIER_MONTH_CELL];
        
        [self setScrollEnabled:YES];
        [self setPagingEnabled:YES];
        
        [self setShowsVerticalScrollIndicator:NO];
        
//        array = @[[NSMutableArray new], [NSMutableArray new], [NSMutableArray new]];
//        arraySizeOfCells = [[NSMutableArray alloc] initWithObjects:[NSValue valueWithCGSize:CGSizeZero], [NSValue valueWithCGSize:CGSizeZero], [NSValue valueWithCGSize:CGSizeZero], nil];
//        arrayWithFirstDay = [[NSMutableArray alloc] initWithObjects:[NSDate new], [NSDate new], [NSDate new], nil];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


#pragma mark - UICollectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZZGridTableCell *cell = (ZZGridTableCell *)[collectionView dequeueReusableCellWithReuseIdentifier:REUSE_IDENTIFIER_MONTH_CELL forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark - UICollectionView Delegate FlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(20, 30);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    CGSize headerViewSize = CGSizeMake(self.frame.size.width, SPACE_COLLECTIONVIEW_CELL);
    
    return headerViewSize;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return SPACE_COLLECTIONVIEW_CELL;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return SPACE_COLLECTIONVIEW_CELL;
}



#pragma mark - UIScrollView Delegate

#pragma mark - Other Methods

@end
