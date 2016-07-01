//
//  BorderView.m
//  ttky
//
//  Created by 许芝光 on 16/1/14.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "BorderView.h"

@implementation BorderView

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
         setCornerRadius:0.0];            //设置矩形四个圆角半径
        [self.layer
         setBorderWidth:0.5];            //边框宽度
        [self.layer
         setBorderColor:colorD.CGColor];
        [self setBackgroundColor:whiteCr];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGFloat y = 0.0;
    if (_count > 0)
    {
        y = rect.size.height / (_count + 1);
    }
// Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 0.5);
    CGContextSetStrokeColorWithColor(context, colorD.CGColor);
//上方分割线
    for (int i = 0; i < _count; i++)
    {
        CGContextMoveToPoint(context, _left, y * (i + 1));
        CGContextAddLineToPoint(context, rect.size.width, y * (i + 1));
    }
    CGContextStrokePath(context);
}

@end
