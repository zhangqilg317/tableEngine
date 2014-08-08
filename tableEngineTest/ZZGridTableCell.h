//
//  ZZGridTableCell.h
//  tableEngineTest
//
//  Created by 张奇 on 14-8-8.
//  Copyright (c) 2014年 com.ebest. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ZZGridTableCellDelegate <NSObject>



@end

@interface ZZGridTableCell : UICollectionViewCell

@property (nonatomic, strong) UITextField   *valueTF;

- (void)setTextFieldBackgroundColor:(UIColor *)color;

@end
