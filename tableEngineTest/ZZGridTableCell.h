//
//  ZZGridTableCell.h
//  tableEngineTest
//
//  Created by 张奇 on 14-8-8.
//  Copyright (c) 2014年 com.ebest. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ZZGridTableCellDelegate <NSObject>

@optional
- (void)theCellTextField:(UITextField *)tf;
- (void)theCellTextFieldEndEditing:(UITextField *)tf;

@end

@interface ZZGridTableCell : UICollectionViewCell<UITextFieldDelegate>

@property (nonatomic, strong) UITextField   *valueTF;
@property (nonatomic, strong) UILabel       *headerLbl;
@property (nonatomic, assign)id<ZZGridTableCellDelegate> delegate;

- (void)initTextField;

- (void)setTextFieldBackgroundColor:(UIColor *)color;

@end
