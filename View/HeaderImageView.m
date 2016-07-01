//
//  HeaderImageView.m
//  ttky
//
//  Created by 许芝光 on 16/1/13.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "HeaderImageView.h"

@implementation HeaderImageView

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
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius  = self.frame.size.width / 2;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius  = self.frame.size.width / 2;
    }
    return self;
}

- (void)canTap:(HeaderImageViewBlock)tap
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
        tapAction((HeaderImageView *)tapgest.view);
    }
}

@end
