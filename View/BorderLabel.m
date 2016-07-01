//
//  BorderLabel.m
//  ttky
//
//  Created by 许芝光 on 16/1/13.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "BorderLabel.h"

@implementation BorderLabel

/*
   // Only override drawRect: if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   - (void)drawRect:(CGRect)rect {
    // Drawing code
   }
 */
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self.layer
         setMasksToBounds:YES];
        [self.layer
         setCornerRadius:2.0];            //设置矩形四个圆角半径
        [self.layer
         setBorderWidth:0.5];            //边框宽度
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)setTextColor:(UIColor *)textColor
{
    [super setTextColor:textColor];
    CGColorRef colorref = textColor.CGColor;
    [self.layer
     setBorderColor:colorref];           //边框颜色
}

- (void)setBackgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor
{
    [self setBackgroundColor:backgroundColor];
    [self.layer
     setBorderColor:borderColor.CGColor];
}

@end
