//
//  BaseLabel.m
//  ttky
//
//  Created by 许芝光 on 16/1/13.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "BaseLabel.h"

@implementation BaseLabel

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
        self.textColor = [UIColor whiteColor];
        self.font      = [UIFont systemFontOfSize:15];
    }
    return self;
}

- (void)setTextColor:(UIColor *)textColor textFont:(UIFont *)font
{
    self.textColor = textColor;
    self.font      = font;
}

@end
