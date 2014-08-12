//
//  GridTableTestViewController.h
//  tableEngineTest
//
//  Created by 张奇 on 14-8-8.
//  Copyright (c) 2014年 com.ebest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZGridTableCell.h"


@interface GridTableTestViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,ZZGridTableCellDelegate>

@property (nonatomic, strong) UICollectionView      *gridTableCollectionView;

@end
