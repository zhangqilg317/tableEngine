//
//  ZZGridTableFlowLayout.m
//  tableEngineTest
//
//  Created by 张奇 on 14-8-8.
//  Copyright (c) 2014年 com.ebest. All rights reserved.
//

#import "ZZGridTableFlowLayout.h"

@implementation ZZGridTableFlowLayout

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.frame.size.width, 3*(self.collectionView.frame.size.height));
}

@end
