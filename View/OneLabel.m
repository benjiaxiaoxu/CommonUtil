//
//  OneLabel.m
//  ttky
//
//  Created by 许芝光 on 16/1/13.
//  Copyright © 2016年 许芝光. All rights reserved.
//

#import "OneLabel.h"

@implementation OneLabel

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 0.5);
    CGContextSetStrokeColorWithColor(context, colorD.CGColor);
    if (_lineColor != nil)
    {
        CGContextSetStrokeColorWithColor(context, _lineColor.CGColor);
    }
    //上方分割线
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, rect.size.width, 0);
    CGContextStrokePath(context);
}

@end
