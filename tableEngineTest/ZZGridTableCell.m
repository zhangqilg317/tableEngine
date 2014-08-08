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
        self.valueTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
        self.valueTF.keyboardType = UIKeyboardTypeNamePhonePad;
        self.valueTF.backgroundColor = [UIColor clearColor];
        [self addSubview:self.valueTF];
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

- (void)setTextFieldBackgroundColor:(UIColor *)color
{
    self.valueTF.backgroundColor = color;
}


@end
