//
//  TapImageView.m
//  Common
//
//  Created by 许芝光 on 16/2/22.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "TapImageView.h"

@implementation TapImageView
- (instancetype)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

/*
   // Only override drawRect: if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   - (void)drawRect:(CGRect)rect {
    // Drawing code
   }
 */
- (void)canTap:(TapImageViewBlock)tap
{
    tapAction = tap;
    [self setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tapgest = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                             action:@selector(tapAction:)];
    [self addGestureRecognizer:tapgest];
}

- (void)tapAction:(UITapGestureRecognizer *)tapgest
{
    if (tapAction)
    {
        tapAction((TapImageView *)tapgest.view);
    }
}

@end
