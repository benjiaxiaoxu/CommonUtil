//
//  BaseTextField.m
//  ttky
//
//  Created by 许芝光 on 16/1/15.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "BaseTextField.h"

@implementation BaseTextField

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
        self.textColor = color9;
        self.font      = TEXTFONTSIZE15;
    }
    return self;
}

- (CGRect)borderRectForBounds:(CGRect)bounds

{
    bounds.size.height = 44;
    return bounds;
}

@end
