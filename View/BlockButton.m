//
//  BlockButton.m
//  Common
//
//  Created by 许芝光 on 16/2/23.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "BlockButton.h"

@implementation BlockButton

/*
   // Only override drawRect: if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   - (void)drawRect:(CGRect)rect {
    // Drawing code
   }
 */
- (void)tapAction:(ButtonBlock)tap
{
    tapblock = tap;
    [self addTarget:self
               action:@selector(action:)
     forControlEvents:UIControlEventTouchUpInside];
}

- (void)action:(BlockButton *)tapgest
{
    if (tapblock)
    {
        tapblock(tapgest);
    }
}

@end
