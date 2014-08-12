//
//  ZZGridTableCell.m
//  tableEngineTest
//
//  Created by 张奇 on 14-8-8.
//  Copyright (c) 2014年 com.ebest. All rights reserved.
//

#import "ZZGridTableCell.h"

@implementation ZZGridTableCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        
        
        self.headerLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        self.headerLbl.textColor = [UIColor colorWithRed:0.504 green:0.874 blue:0.897 alpha:1.000];
        [self.headerLbl setFont:[UIFont systemFontOfSize:17.0f]];
        self.headerLbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.headerLbl];
        
        self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        self.layer.borderWidth = 1.0f;
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

- (void)initTextField
{
    
    [self.headerLbl removeFromSuperview];
    
//    NSLog(@"frame:%@",NSStringFromCGRect(self.frame));
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    self.valueTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    self.valueTF.textColor = [UIColor darkGrayColor];
    self.valueTF.font = [UIFont systemFontOfSize:17.0f];
    self.valueTF.textAlignment = NSTextAlignmentCenter;
    self.valueTF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.valueTF.backgroundColor = [UIColor clearColor];
    self.valueTF.delegate = self;
    [self addSubview:self.valueTF];

}

- (void)setTextFieldBackgroundColor:(UIColor *)color
{
    self.valueTF.backgroundColor = color;
}

#pragma mark - UITextFieldDelegate

// 当输入框获得焦点时，执行该方法。
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (_delegate != nil && [self.delegate respondsToSelector:@selector(theCellTextField:)] )
    {
        [self.delegate theCellTextField:textField];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (_delegate != nil && [self.delegate respondsToSelector:@selector(theCellTextFieldEndEditing:)] )
    {
        [self.delegate theCellTextFieldEndEditing:textField];
    }
}


@end
